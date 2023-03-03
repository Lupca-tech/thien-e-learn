Rails.application.routes.draw do
  resources :microposts
  root 'home#index'
  get 'calendar/show'
  
  namespace :students do
  end

  namespace :teachers do
    resources :session, only: [:create, :new, :destroy]
    resources :teachers
  end
end
