module Nutrition
  class SourceCode < ApplicationRecord
    self.table_name = 'src_cd'
    self.primary_key = 'src_cd'

    alias_attribute :id, :src_cd

    def readonly?
      true
    end
  end
end