Rails.application.routes.draw do
  devise_for :users

# TODO Users index
# TODO View other user profiles
  resources :users, only: [:show]
  resources :items

  root to: 'users#show'
end
