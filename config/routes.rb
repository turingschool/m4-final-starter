Rails.application.routes.draw do
  root to: "links#index"

  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create'

  resources :users, only: [:new]

  resources :home, only: [:index]

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
