Rails.application.routes.draw do
  get "categories/index"
  root "pages#home"
  resources :articles
  # get "articles", to: "articles#index"
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
