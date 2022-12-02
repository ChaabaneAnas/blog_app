Rails.application.routes.draw do
  root "users#index"
  get "/users", to: "users#index"
  
  resources :users, only: [:show] do
    resources :posts,only: [:show, :index] do
      resources :comments, only: [:show, :new, :index]
    end
  end 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
