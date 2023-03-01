Rails.application.routes.draw do
  root 'home#index'
  get 'calendar/show'

  namespace :students do
  end

  namespace :teachers do
  end
end
