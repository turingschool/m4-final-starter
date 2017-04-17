Rails.application.routes.draw do
  root to: "links#index"

  get '/home',                  to: 'users#authenticate'
  get '/signup',                to: 'users#new'
  post '/users',                to: 'users#create'

  get '/login',                 to: 'sessions#new'
  post '/login',                to: 'sessions#create'
  get '/logout',                to: 'sessions#destroy'

  resources :links,             only: [:index, :create, :update, :edit]

  namespace :api do
    namespace :v1 do
      resources :links,         only: [:update]
    end
  end
end
