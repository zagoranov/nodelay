Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root :to => 'tasks#index'

  resources :sessions do
      member do
        get 'load'
      end
  end

  resources :users do
    resources :posts
    resources :messages
   
    resources :tasks
    resources :impulses
    resources :impulsetreattypes  
  end

  resources :posts do
    resources :comments
  end

  resources :tasks do
    member do
      post 'itsdone'
    end
  end
  
  resources :treats do
    member do
      post 'eatit'
    end
  end
  
  resources :impulses
  resources :impulsetreattypes do
    member do
      post 'kill'
      get 'buy'
    end
  end


  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  get "wellhello" => "tasks#index", :as => "wellhello"
  get "loadthatshit" => "sessions#load", :as => "loadthatshit"

end

