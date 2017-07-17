Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index]
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
