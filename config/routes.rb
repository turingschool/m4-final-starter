Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index]
  get '/login' => "sessions#new", as: 'login'
  get '/signup' => 'users#new', as: 'signup'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
