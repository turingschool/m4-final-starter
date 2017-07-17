Rails.application.routes.draw do
  root to: "links#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :links, only: [:index, :create]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
