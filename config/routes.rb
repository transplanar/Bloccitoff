Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :index] do
    resources :items, only: [:index, :create, :destroy]
  end

  root to: 'users#current_user_home'
end
