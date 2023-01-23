Rails.application.routes.draw do
  root "pages#home"
  resources :articles
  # get "articles", to: "articles#index"
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  resources :users, except: [:new]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
