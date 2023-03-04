Rails.application.routes.draw do
  resources :chat_messages
  resources :chat_rooms
  resources :microposts
  resources :rooms

  root 'home#index'
  get 'calendar/show'
  
  namespace :students do
    resources :session, only: [:create, :new, :destroy]
  end

  namespace :teachers do
    resources :session, only: [:create, :new, :destroy]
  end
end
