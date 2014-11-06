Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root to: 'posts#index'

  resources :users do
    resources :posts
    resources :messages    
  end

  resources :posts

  get "log_in" => "sessions#create", :as => "log_in"

end
