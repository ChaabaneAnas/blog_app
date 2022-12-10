Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  get "/users", to: "users#index"
  
  resources :users, only: [:show] do
    resources :posts,only: [:new, :create,:index, :show, :destroy] do
      resources :comments
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do 
        resources :posts do 
          resources :comments
        end
      end
    end
  end


end
