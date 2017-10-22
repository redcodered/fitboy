module Nutrition
  class DataSource < ApplicationRecord
    self.table_name = 'data_src'
    self.priamary_key = 'datasrc_id'

    alias_attribute :id, :datasrc_id

    has_and_belongs_to_many :food_items,
                            :class_name => 'Nutrition::FoodItem',
                            join_table: 'datscrln',
                            foreign_key: 'nbd_no',
                            association_foreign_key: 'datasrc_id'

    has_and_belongs_to_many :nutrients,
                            :class_name => 'Nutrition::Nutrient',
                            join_table: 'datscrln',
                            foreign_key: 'nutr_no',
                            association_foreign_key: 'datasrc_id'

    def readonly?
      true
    end
  end
end
