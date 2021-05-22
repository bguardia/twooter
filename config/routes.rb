Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :twoots
  
  #viewing users
  resources :users, only: [:show]

  # likes
  get "like/twoot/:twoot_id", to: "likes#create", as: :like
  delete "unlike/twoot/:twoot_id", to: "likes#destroy", as: :unlike

  # follows
  get "follow/user/:followed_id", to: "follows#create", as: :follow
  delete "unfollow/user/:followed_id", to: "follows#destroy", as: :unfollow

  #replies
  resources :replies, only: [:new, :create]

  # resources :likes, only: [:create, :destroy]
  root "twoots#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
