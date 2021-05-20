Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :twoots
  get "like/twoot/:twoot_id", to: "likes#create"
  delete "unlike/twoot/:twoot_id", to: "likes#destroy"
  # resources :likes, only: [:create, :destroy]
  root "twoots#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
