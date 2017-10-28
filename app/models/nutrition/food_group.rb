module Nutrition
  class FoodGroup < ApplicationRecord
    self.table_name = 'fd_group'
    self.primary_key = 'fdgrp_cd'

    has_many :food_items,
             :class_name => 'Nutrition::FoodItem',
             foreign_key: 'fdgrp_cd',
             primary_key: 'fdgrp_cd'

    def readonly?
      true
    end

    def entity
      Entity.new(self)
    end

    class Entity < Grape::Entity
      expose :fdgrp_cd, as: :id, documentation: ds('food_group.fields.fdgrp_cd')
      expose :description, documentation: ds('food_group.fields.description')
    end
  end
end