module NutritionData
  class Docstring
    DOCSTRING_FILE_PATH = "#{Rails.root}/lib/nutrition_data/api_docstrings.yml"
    def self.docstring(key)
      @@docfile ||= File.read(DOCSTRING_FILE_PATH)
      @@docstrings ||= YAML.load(@@docfile)
      obj = nil
      key.split('.').each { |k| obj.nil? ? obj = @@docstrings[k] : obj = obj[k] }
      return obj
    end
  end
end