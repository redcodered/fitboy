module Nutrition
  class DataSource < ApplicationRecord
    self.table_name = 'data_src'
    self.priamary_key = 'datasrc_id'

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

    def entity
      Entity.new(self)
    end

    class Entity < Grape::Entity
      expose :authors
      expose :title
      expose :year
      expose :journal
      expose :volume_city
      expose :issue_state
      expose :start_page
      expose :end_page
      expose :datasrc_id
    end
  end
end
