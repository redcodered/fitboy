module Grape
  class Entity
    def self.ds(key)
      NutritionData::Docstring.docstring(key)
    end
  end
end