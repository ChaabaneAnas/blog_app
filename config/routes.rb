Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  get "/users", to: "users#index"
  
  resources :users, only: [:show] do
    resources :posts,only: [:new, :create,:index, :show] do
      resources :comments, only: [:index, :new, :create, :show]
      resources :likes, only: [:create]
    end
  end 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
