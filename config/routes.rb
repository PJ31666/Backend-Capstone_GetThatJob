Rails.application.routes.draw do
  # SESSIONS
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :users do
    resources :applications
  end
  resources :jobs
  resources :categories
  resources :followings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
