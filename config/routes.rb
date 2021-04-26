Rails.application.routes.draw do
  resources :blogs
  post 'auth/login'
  resources :auth
  resources :posts
  resources :accounts
  resources :users
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
