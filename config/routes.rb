Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'

  devise_for :users
  # resources :users
  resources :posts do
    member do
      get 'like', to: 'posts#like'
      get 'unlike', to: 'posts#unlike'
    end
  end
  resources :comments, only: [:create, :destroy,:new]

  # resources :friend_requests, only: [:create, :accept, :decline]
  # get 'friend_requests', to: 'friend_requests#create'
  # resources :users do
  #   post 'friend_requests', to: 'friend_requests#create', as: :send_friend_request
  #   post 'friend_requests/:friend_id/accept', to: 'friend_requests#accept', as: :accept_friend_request
  #   post 'friend_requests/:friend_id/decline', to: 'friend_requests#decline', as: :decline_friend_request
  # end
  resources :users

  root "posts#index"
end
