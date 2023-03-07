Rails.application.routes.draw do
 
  resources :subject
  resources :chat_messages
  resources :microposts
  root 'home#index'
  
  namespace :students do
    resources :session, only: [:create, :new, :destroy]
    get 'calendar/show'
    patch 'calendar/create'
    resources :countdowns
  end

  namespace :teachers do
    resources :session, only: [:create, :new, :destroy]
  end
end
