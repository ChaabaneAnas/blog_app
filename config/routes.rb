Rails.application.routes.draw do
  root "users#show"
  get "/users", to: "users#index"
  
  resources :users, only: [:show] do
    resources :posts,only: [:show, :index]  
  end 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
