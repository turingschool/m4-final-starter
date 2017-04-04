Rails.application.routes.draw do
  root to: "links#index"

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signup' => 'users#new'

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
