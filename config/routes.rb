Rails.application.routes.draw do
  get 'users_controller/show'

  devise_for :users

  # root to: "home#index"
  root to: "users#show"
end
