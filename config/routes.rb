Rails.application.routes.draw do

    scope 'app' do

        resources :quantities, only: [:index, :show] do
            get 'units_of_measurement', to: 'unit_of_measurements#index'
        end
        resources :unit_of_measurements, only: [:show]
        resources :constants, only: [:show]
        resources :equations, only: [:show]
        resources :calculations, except: [:new, :edit] do
            resources :measurements, only: [:show, :update], controller: 'calculations/measurements'
        end

        resources :categories, only: [:index, :show]
        resources :packs, only: [:show]

        resources :purchases, only: [:create]

        devise_for :users, path: '', controllers: {
            sessions: 'users/sessions',
            registrations: 'users/registrations'
        }, path_names: {
            sign_in: 'login',
            sign_up: 'signup',
            sign_out: 'logout',
            password: 'forgot',
            edit: 'account'
        }

        get 'search', to: 'search#index'

        get 'setup', to: 'welcome#setup'
        get 'language', to: 'welcome#language', constraints: Modalist::Ajax.new

        root 'calculations#new', as: :app_root

    end

    root 'welcome#index'

    match '*path', to: 'r404#not_found', via: :all

end
