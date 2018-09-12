Rails.application.routes.draw do

  devise_for :users
  root "desserts#index"

  namespace :admin do
    resources :users
    root "desserts#index"
  end

end
