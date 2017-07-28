Rails.application.routes.draw do
  root to: "links#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :links, only: [:index, :create, :update, :destroy]
    end
  end
end
