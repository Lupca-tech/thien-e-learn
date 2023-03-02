Rails.application.routes.draw do
  root 'home#index'
  get 'calendar/show'
  resources :teachers
  namespace :students do
  end

  namespace :teachers do
    resources :session, only: [:create, :new, :destroy]
    resources :microposts, only: [:create, :show, :destroy]
  end
end
