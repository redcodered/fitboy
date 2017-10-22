module Nutrition
  class LangulFactor < ApplicationRecord
    self.table_name = 'langdesc'
    self.primary_key = 'factor_code'

    alias_attribute :id, :factor_code

    has_and_belongs_to_many :food_items,
                            join_table: 'langual',
                            class_name: 'Nutrition::FoodItem',
                            foreign_key: 'nbd_no',
                            association_foreign_key: 'factor_code'

    def readonly?
      true
    end
  end
end