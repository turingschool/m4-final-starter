Rails.application.routes.draw do
  root to: "links#index"

  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: "logout"

  resources :users, only: [:new, :create]

  resources :home, only: [:index]

  resources :links, only: [:index, :new, :create, :edit]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
