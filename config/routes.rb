Rails.application.routes.draw do
  resources :unit_of_measurements
  resources :quantities
  resources :equations
  resources :calculations
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
