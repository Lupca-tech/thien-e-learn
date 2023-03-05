Rails.application.routes.draw do
  resources :microposts
  root 'home#index'
  
  namespace :students do
    resources :session, only: [:create, :new, :destroy]
    get 'calendar/show'
    patch 'calendar/create'
  end

  namespace :teachers do
    resources :session, only: [:create, :new, :destroy]
  end
end
