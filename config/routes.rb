Rails.application.routes.draw do
  resources :categories
  root "categories#index"
  get "signup", to: "users#new"
  delete "signout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  resources :users, except: [:new]
  resources :articles do
    resources :votes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
