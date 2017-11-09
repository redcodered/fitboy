module Nutrition
  class FoodItem < ApplicationRecord
    KCAL_NUTR_NO = 208

    self.table_name = 'food_des'
    self.primary_key = 'nbd_no'

    belongs_to :food_group,
               :class_name => 'Nutrition::FoodGroup',
               foreign_key: 'fdgrp_cd',
               primary_key: 'fdgrp_cd'

    has_many :nutrient_data_points,
             class_name: 'Nutrition::NutrientDataPoint',
             foreign_key: 'nbd_no',
             primary_key: 'nbd_no'

    has_many :nutrients,
             :class_name => 'Nutrition::Nutrient',
             through: :nutrient_data_points,
             foreign_key: 'nbd_no',
             primary_key: 'nbd_no'

    has_many :serving_sizes,
             class_name: 'Nutrition::Weight',
             foreign_key: 'nbd_no',
             primary_key: 'nbd_no'

    has_and_belongs_to_many :langual_factors,
                            join_table: 'langual',
                            class_name: 'Nutrition::Langual',
                            foreign_key: 'factor_code',
                            association_foreign_key: 'nbd_no'

    has_and_belongs_to_many :data_sources,
                            :class_name => 'Nutrition::DataSource',
                            join_table: 'datscrln',
                            foreign_key: 'datasrc_id',
                            association_foreign_key: 'nbd_no'

    class << self
      def search(query)
        q = <<~HEREDOC
          ( short_description ~* '%s' 
            OR long_description ~* '%s' 
            OR manufacturer_name ~* '%s'
            OR scientific_name ~* '%s' )
        HEREDOC
        self.where query.split.map { |w| q % ([w]*4) }.join(' AND ')
      end
    end

    def nutrition
      ndp = nutrient_data_points
          .includes(:nutrient)
          .order('nutr_def.sr_order')
          .to_a
      serving_sizes.map { |portion| NutritionInfoStruct.new(portion, ndp) }
    end

    def calories
      NutrientDataPoint.find_by(
        nbd_no: nbd_no,
        nutr_no: KCAL_NUTR_NO)
          .nutrient_value.to_i
    end

    def readonly?
      true
    end

    def entity
      Entity.new(self)
    end

    class NutritionInfoStruct
      attr_accessor :serving_size, :nutrients

      def initialize(portion, ndp)
        @serving_size = portion
        @nutrients = ndp.map do |dp|
          NutritionDataPointStruct.new(
            nutrient: dp.nutrient.nutrient_description,
            tagname: dp.nutrient.tagnames,
            units: dp.nutrient.units,
            nutrient_value: (dp.nutrient_value / 100) * portion.gram_weight,
            added_nutrient: dp.added_nutrient
        )
        end
      end

      def entity
        Entity.new(self)
      end

      class Entity < Grape::Entity
        expose :serving_size do |i|
          "#{i.serving_size.amount} #{i.serving_size.description} (#{i.serving_size.gram_weight}g)"
        end
        expose :nutrients
      end
    end

    class NutritionDataPointStruct
      attr_accessor :nutrient, :tagname, :units, :nutrient_value, :added_nutrient
      def initialize(args)
        args.each { |k,v| instance_variable_set "@#{k}", v }
      end


    end

    class BasicEntity < Grape::Entity
      expose :nbd_no
      expose :long_description
      expose :scientific_name
      expose :short_description
      expose :manufacturer_name
      expose :common_name
      expose :calories
    end

    class Entity < Grape::Entity
      # Properties
      expose :nbd_no
      expose :long_description
      expose :short_description
      expose :common_name
      expose :scientific_name
      expose :manufacturer_name
      expose :survey
      expose :refuse_percent
      # Relations
      expose :food_group
      expose :serving_sizes
      expose :nutrition, using: NutritionInfoStruct::Entity
    end
  end
end


# .each_with_object (Hash.new) { | val, memo | memo[val.nutrient.nutrient_description] = val }
