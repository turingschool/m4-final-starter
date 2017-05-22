Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index]
  resources :guests, only: [:index]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new]
  post 'users/new', to: 'users#create'
  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
