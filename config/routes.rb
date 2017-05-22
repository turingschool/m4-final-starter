Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index]
  resources :guests, only: [:index]
  resources :users, only: [:new]
  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
