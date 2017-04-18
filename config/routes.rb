Rails.application.routes.draw do
  root to: "links#index"

  resources :links# only: [:index, :create, :update, :show]
  get '/login' => "sessions#new", as: 'login'
  post '/login' => "sessions#create"
  get '/signup' => 'users#new', as: 'signup'
  delete '/logout' => 'sessions#destroy', as: 'logout'
  # delete '/logout' => 'sessions#destroy', as: 'logout'
  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :update, :create]
    end
  end
end
