module NutritionData
  class API < Grape::API
    version 'v1', using: :header, vendor: 'sckamar'
    format :json

    resource :food_group do
      desc 'get all food groups', { params: Nutrition::FoodGroup::Entity.documentation }
      get '/' do
        groups = FoodGroup.all
        present groups, with: Entities::FoodGroup
      end
    end

    add_swagger_documentation base_path: '/nutrition/api'

  end
end