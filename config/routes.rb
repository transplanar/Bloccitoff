Rails.application.routes.draw do
  devise_for :users

# TODO Users index
# TODO View other user profiles
  # resources :users, only: [:show]
  # resources :users, only: [:show, :index]
  resources :users, only: [:show, :index] do
    resources :items, only: [:index, :create, :destroy]
  end

  # root to: 'users#show', [current_user.id]
  # TODO Default to the show view of a specific user?
  root to: 'users#current_user_home'
end
