Rails.application.routes.draw do

    mount Native::Engine, at: '/native'

    mount Pwa::Engine, at: ''

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
            sessions: 'users/devise/sessions',
            registrations: 'users/devise/registrations'
        }, path_names: {
            sign_in: 'login',
            sign_up: 'signup',
            sign_out: 'logout',
            password: 'forgot',
            edit: 'account'
        }

        get 'search', to: 'search#index'
        get 'search/render', to: 'search#renderer'

        get 'setup', to: 'welcome#index'
        get 'language', to: 'welcome#language'

        root 'calculations#new', as: :app_root
    end


    get 'privacy', to: 'welcome#privacy'
    root 'welcome#product'

    match '*path', to: 'r404#not_found', via: :all

end
