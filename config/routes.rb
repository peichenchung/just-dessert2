Rails.application.routes.draw do
  
  devise_for :users
  root "desserts#index"

  namespace :admin do
    root "desserts#index"
  end

end
