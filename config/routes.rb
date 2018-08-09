Rails.application.routes.draw do
  get 'landing/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'
  mount Nutrition::API => '/api/nutrition'
  get '/app(/*all)', to: 'viewer_app#app'
  get '/nutrition/test', to: 'viewer_app#test'
end
