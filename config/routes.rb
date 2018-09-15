Rails.application.routes.draw do

  devise_for :users

  resources :desserts do
    resources :orders, only: [:new, :create, :destroy] do
      member do
        get :order_list
      end
    end
  end

  resources :users, only: [:show, :edit, :update]
  resources :orders
  root "desserts#index"

  namespace :admin do
    resources :users
    root "desserts#index"
  end

end
