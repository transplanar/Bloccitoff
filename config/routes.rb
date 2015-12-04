Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  resources :items, only: [:create, :destroy]

  root to: 'users#show'
end
