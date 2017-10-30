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

    def entity
      Entity.new(self)
    end

    class Entity < Grape::Entity
      expose :nbd_no
      expose :seq
      expose :amount
      expose :description
      expose :gram_weight
      expose :data_pts
      expose :standard_deviation
    end

  end
end