Rails.application.routes.draw do
  
  root "desserts#index"

  namespace :admin do
    root "desserts#index"
  end

end
