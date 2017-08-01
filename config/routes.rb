Rails.application.routes.draw do
  root to: "links#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  resources :users, only: [:new, :create]
  resources :links, only: [:index, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update, :create]
    end
  end
end
