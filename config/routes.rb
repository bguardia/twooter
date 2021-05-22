Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :twoots

  # likes
  get "like/twoot/:twoot_id", to: "likes#create"
  delete "unlike/twoot/:twoot_id", to: "likes#destroy"

  # follows
  get "follow/user/:followed_id", to: "follows#create"
  delete "unfollow/user/:followed_id", to: "follows#delete"

  #replies
  get "reply/twoot/:reply_id", to: "replies#new"
  post "reply", to: "replies#create"

  # resources :likes, only: [:create, :destroy]
  root "twoots#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
