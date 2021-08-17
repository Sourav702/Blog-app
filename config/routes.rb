Rails.application.routes.draw do
  resources :users
  resources :home, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  get "signup", to: "users#new", as: "signup"
  post "/users" => "users#create"
  get "login", to: "sessions#new", as: "login"

  get "logout", to: "sessions#destroy", as: "logout"

  root "home#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
