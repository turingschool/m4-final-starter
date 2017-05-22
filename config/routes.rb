Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index, :create, :edit, :update]
  resources :guests, only: [:index]
  resources :users, only: [:new, :create]
  post 'users/new', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
