Rails.application.routes.draw do

    resources :quantities, only: [:index, :show] do
        get 'units_of_measurement', to: 'unit_of_measurements#index'
    end
    resources :calculations, except: [:new, :edit] do
        resources :measurements, only: [:show, :update], controller: 'calculations/measurements'
    end

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

    get 'setup', to: 'welcome#index'
    get 'language', to: 'welcome#language'
    get 'drafts', to: 'welcome#drafts'
    get 'privacy', to: 'welcome#privacy'

    root 'calculations#new'

    match '*path', to: 'errors#not_found', via: :all

end
