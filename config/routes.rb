Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :posts
  resources :friend_requests, only: [:create, :accept, :decline]
  # post 'friend_requests', to: 'friend_requests#create'

  root "posts#index"
end
