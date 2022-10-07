Rails.application.routes.draw do
  resources :users
  resources :applications
  resources :jobs
  resources :categories
  resources :followings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # SESSIONS
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
