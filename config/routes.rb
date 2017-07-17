Rails.application.routes.draw do
  root to: "links#index"
  get '/login' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :users, only: [:create]
  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update, :create]
    end
  end
end
