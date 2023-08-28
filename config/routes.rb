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
   resources :users

   resources :friendship, only: [:index, :create, :destroy]
   get 'accepted_friends', to: 'friendship#accepted_friends', as: 'accepted_friends'

   resources :users, only: [:index]
  
  resources :friend_requests, only: [:new, :create] do
    member do
      get 'accept'
      delete 'reject'
      get :received
      patch :accept

    end
  end

  
  get 'friend_requests/received', to: 'friend_requests#received', as: :received_friend_requests
  
  
  resources :notifications, only: [:index] do
    member do
      patch 'mark_as_read'
    end
  end
  root "posts#index"
end
