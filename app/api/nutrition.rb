module Nutrition
  class API < Grape::API
    version 'v1', using: :header, vendor: 'sckamar'
    format :json

    resource :food do
      desc 'Get a food item.' do
        named 'Get Food Item'
        entity FoodItem::Entity
      end
      params do
        requires :nbd_no, type: Integer, desc: 'NDB Number'
      end
      route_param :nbd_no do
        get '/' do
          present FoodItem.find(params[:nbd_no]), using: FoodItem::Entity
        end
      end

      namespace :condensed do
        desc 'Get a food item (condensed nutrition info).' do
          named 'Get Food Item'
          entity FlatFoodItem::Entity
        end
        params do
          requires :nbd_no, type: Integer, desc: 'NDB Number'
        end
        route_param :nbd_no do
          get '/' do
            present :food_info, FoodItem.find(params[:nbd_no]), with: FoodItem::BasicEntity
            present :nutrition_info, FlatFoodItem.find(params[:nbd_no]), using: FlatFoodItem::Entity
          end
        end
      end

      namespace :search do
        desc 'Search for a food item' do
          named 'Search Food Items'
          entity FoodItem::BasicEntity
        end
        params do
          requires :query, type: String, desc: 'Search Query'
        end
        route_param :query do
          get '/' do
            present FoodItem.search(params[:query]), with: FoodItem::SearchContainer
          end
        end
      end
    end

    resource :food_group do
      desc 'Lists all food groups.' do
        named 'List Food Groups'
        entity FoodGroup::Entity
      end
      get '/' do
        groups = FoodGroup.all
        present groups
      end

      desc 'Get a food group.' do
        named 'Get Food Group'
        entity FoodGroup::Entity
      end
      params do
        requires :fdgrp_cd, type: Integer, desc: 'Food Group code (SR28)'
      end
      route_param :fdgrp_cd do
        get do
          present FoodGroup.find(params[:fdgrp_cd])
        end
      end
    end

    add_swagger_documentation base_path: '/api/nutrition'

  end
end