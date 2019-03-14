Rails.application.routes.draw do
  # resources :controllers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      resources :calculation_record
    end
  end
end
