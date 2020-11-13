Rails.application.routes.draw do
  resources :feeds
  resources :users
  # resources :users, only:[:new, :create, :update, :destroy]
  resources :sessions, only:[:new, :create, :destroy]
end
