module Nutrition
  class Footnote < ApplicationRecord
    self.table_name = 'footnote'

    belongs_to :food_item,
               :class_name => 'Nutrition::FoodItem',
               foreign_key: 'nbd_no',
               primary_key: 'nbd_no'

    belongs_to :nutrient,
               :class_name => 'Nutrition::Nutrient',
               foreign_key: 'nutr_no',
               primary_key: 'nutr_no'

    def readonly?
      true
    end
  end
end