Rails.application.routes.draw do
  root to: "links#index"

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  
  delete 'signout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  resources :links, only: [:index, :create, :update]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :create, :update]
    end
  end
end
