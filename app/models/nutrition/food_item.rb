module Nutrition
  class FoodItem < ApplicationRecord
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

    # TODO: Flesh out nutrition method
    def nutrition
      # this method will contain logic to serialize nutrient info. or flatten it anyway.
      puts 'hi'
    end


    def readonly?
      true
    end
  end
end