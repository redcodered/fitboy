module Nutrition
  class Weight < ApplicationRecord
    self.table_name = 'weight'


    belongs_to :food_item,
               :class_name => 'Nutrition::FoodItem',
               foreign_key: 'nbd_no',
               primary_key: 'nbd_no'

    def readonly?
      true
    end
  end
end