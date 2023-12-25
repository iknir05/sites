Rails.application.routes.draw do
  get 'passwords/edit'
  get 'passwords/update'
  root 'sessions#index'

  resources :sessions
  resources :posts

  get "/home", to: "posts#home"
  get "/login", to: "logins#new"
  post "/check_login", to: "logins#check_login"

  # root 'posts#home'  
  # get 'posts/home'
  # get 'posts/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
