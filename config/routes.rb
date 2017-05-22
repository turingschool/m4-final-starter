Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index]

  get '/', to: redirect('/login')


  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
