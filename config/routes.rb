Rails.application.routes.draw do

    resources :quantities, only: [:index, :show] do
        get 'units_of_measurement', to: 'unit_of_measurements#index'
    end
    resources :calculations, except: [:new, :edit] do
        resources :measurements, only: [:show], controller: 'calculations/measurements'
    end

    devise_for :users, skip: [:sessions, :registrations], controllers: { sessions: 'users/devise/sessions', registrations: 'users/devise/registrations' }
    as :user do
        ### Sessions
        get 'login', to: 'devise/sessions#new', as: :new_user_session
        post 'login', to: 'devise/sessions#create', as: :user_session
        delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
        ### Registrations
        get 'account', to: 'devise/registrations#edit', as: :edit_user_registration
        get 'signup', to: 'devise/registrations#new', as: :new_user_registration
        post 'signup', to: 'devise/registrations#create', as: :user_registration
    end

    get 'setup', to: 'welcome#index'
    get 'language', to: 'welcome#language'
    get 'drafts', to: 'welcome#drafts'
    get 'privacy', to: 'welcome#privacy'

    root 'calculations#new'

    match '*path', to: 'errors#not_found', via: :all

end
