Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index, :create]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end

resources :users, only: [:new, :create, :show]

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
end
