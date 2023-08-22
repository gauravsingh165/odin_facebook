Rails.application.routes.draw do
  get 'friendships/create'
  get 'friendships/destroy'

  devise_for :users
  resources :users
  resources :posts
  root "posts#index"
end
