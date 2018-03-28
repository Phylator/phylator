Rails.application.routes.draw do

    mount Pwa::Engine, at: ''

    scope 'app' do

        resources :quantities, only: [:index, :show] do
            get 'units_of_measurement', to: 'unit_of_measurements#index'
        end
        resources :unit_of_measurements, path: 'units', only: [:show]
        resources :constants, only: [:show]
        resources :equations, only: [:show]
        resources :calculations, except: [:new] do
            resources :measurements, only: [:show, :update], controller: 'calculations/measurements'
        end
        get 'what', to: 'calculations#what'
        get 'how', to: 'calculations#how'
        get 'measurements', to: 'calculations#measurements'

        resources :categories, only: [:index, :show]
        resources :packs, only: [:show] do
            get 'checkout', to: 'packs#checkout', constraints: Modalist::Ajax.new
        end

        resources :purchases, only: [:create]

        devise_for :users, path: '', controllers: {
            sessions: 'users/sessions',
            registrations: 'users/registrations',
            passwords: 'users/passwords'
        }, path_names: {
            sign_in: 'signin',
            sign_up: 'signup',
            sign_out: 'signout',
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
