module Nutrition
  class DataDerivationCode < ApplicationRecord
    self.table_name = 'deriv_cd'
    self.primary_key = 'deriv_cd'

    def readonly?
      true
    end
  end
end