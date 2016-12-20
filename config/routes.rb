Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "links#index"

  resources :links, only: [:index, :create, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :create, :update]
    end
  end
end
