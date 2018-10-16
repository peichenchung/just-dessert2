Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  post "spgateway/return"

  resources :desserts do
    resources :orders
    resources :comments, only: [:create, :destroy] do
      resources :replies, only: [:create, :destroy]
    end
  end
  
  resources :categories, only: :show
  resources :users, only: [:show, :edit, :update]
  resources :orders do
    post :checkout_spgateway, on: :member
  end
  root "desserts#index"

  namespace :admin do
    resources :users
    resources :categories
    root "users#index"
  end

end
