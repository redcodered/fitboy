module Nutrition
  class Nutrient < ApplicationRecord
    self.table_name = 'nutr_def'
    self.primary_key = 'nutr_no'
    alias_attribute :id, :nutr_no

    has_many :nutrient_data_points,
             :class_name => 'Nutrition::NutrientDataPoint',
             foreign_key: 'nutr_no',
             primary_key: 'nutr_no'

    has_many :food_items,
             :class_name => 'Nutrition::FoodItem',
             through: :nutrient_data_points,
             foreign_key: 'nbd_no',
             primary_key: 'nbd_no'

    has_and_belongs_to_many :data_sources,
                            :class_name => 'Nutrition::DataSource',
                            join_table: 'datscrln',
                            foreign_key: 'datasrc_id',
                            association_foreign_key: 'nutr_no'

    def readonly?
      true
    end
  end
end