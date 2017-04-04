Rails.application.routes.draw do
  root to: "home#index"

  resources :links, only: [:index]
  resources :users, only: [:new, :create]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
