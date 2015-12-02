Rails.application.routes.draw do
  # get 'items/create'

  # get 'user/show'

  # get 'users_controller/show'

  #REVIEW is routing for items correct?
  devise_for :users

# REVIEW Needed?
  resources :users do
    resources :items, only: [:create]
  end
  # devise_for :users do
    # resources :items, only: [:create]
  # end

# NOTE Test of nesting
  # resources :items, only: [:create]

  # root to: "home#index"
  root to: 'users#show'
end
