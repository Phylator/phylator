Rails.application.routes.draw do
    resources :unit_of_measurements
    resources :quantities
    resources :equations
    resources :calculations, except: [:new]
    devise_for :users

    root 'calculations#new'
end
