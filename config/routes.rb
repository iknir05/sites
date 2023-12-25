  Rails.application.routes.draw do
  get 'passwords/edit'
  get 'passwords/update'
  root 'sessions#index'

  # resources :sessions
  resources :posts

  get "/home", to: "posts#home"
  # get "/login", to: "logins#new"
  # post "/check_login", to: "logins#check_login"

  get 'sign_up', to: 'sessions#new'
  post 'sign_up', to: 'sessions#create'
  get 'sign_in', to: 'logins#new'
  post 'sign_in', to: 'logins#create', as: 'log_in'
  get 'logout', to: 'logins#destroy'
  get 'password',  to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit', as: 'reset_password'
  patch 'password/reset/edit', to: 'password_resets#update'



  # root 'posts#home'  
  # get 'posts/home'
  # get 'posts/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
