Rails.application.routes.draw do

  devise_for :users
  resources :desserts
  root "desserts#index"

  namespace :admin do
    resources :users
    root "desserts#index"
  end

end
