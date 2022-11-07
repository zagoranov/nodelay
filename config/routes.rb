Rails.application.routes.draw do

  root :to => 'tasks#gtd'

  resources :sessions do
      member do
        get 'load'
        get 'sethumidity'
        get 'gethumidity'
	get 'sendatelegram'
      end
  end

  resources :users do
    resources :projects
    resources :profilecomments
  end

  resources :projects do  
    resources :tasks
  end

  resources :tags

  resources :tasks do
    resources :tags        
    collection do
      get 'gtd'
      get 'inbox'
      get 'calendar'
      get 'nocalendar'
      get 'delayed'
      get 'links'
      get 'delegated'
      get 'someday'
      get 'tagsearch'
      get 'donelist'
    end
    member do
      post 'itsdone'
      get 'itsdone'      
      post 'undone'      
      post 'delay'
      post 'undelay'
      post 'totoday'
      post 'totomorrow'
    end
  end
  
  resources :friendships do
    member do
      post 'wellhello'
      post 'byebye'
    end
  end

  resources :enviros do
    member do
      post 'add'
    end
  end


  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  get "tldr" => "tasks#help", :as => "tldr"
  
  get "loadthatshit" => "sessions#load", :as => "loadthatshit"
  get "sethumidity" => "sessions#sethumidity", :as => "sethumidity"
  get "gethumidity" => "sessions#gethumidity", :as => "gethumidity"
  get "sendatelegram" => "sessions#sendatelegram", :as => "sendatelegram"
  
end

