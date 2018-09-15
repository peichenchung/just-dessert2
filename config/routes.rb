Rails.application.routes.draw do

  devise_for :users
  resources :desserts
  resources :users, only: [:show, :edit, :update]
  resources :orders
  root "desserts#index"

  namespace :admin do
    resources :users
    root "desserts#index"
  end

end
