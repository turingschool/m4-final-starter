Rails.application.routes.draw do
  root to: "home#index"

  resources :links, only: [:index]
  resources :login, only: [:new]
  resources :users, only: [:new]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
