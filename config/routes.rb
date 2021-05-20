Rails.application.routes.draw do
  devise_for :users
  resources :twoots
  root "twoots#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
