Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index]
  resources :guests, only: [:index]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  post 'users/new', to: 'users#create'
  post '/login', to: 'sessions#create'
  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
