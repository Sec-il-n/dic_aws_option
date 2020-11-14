Rails.application.routes.draw do
  resources :feeds do
    # confirm_feeds
   collection do
     post :confirm
   end
 end
  resources :users
  resources :favorites, only:[:create, :destroy, :index, :show]
  # resources :users, only:[:new, :create, :update, :destroy]
  resources :sessions, only:[:new, :create, :destroy]
end
