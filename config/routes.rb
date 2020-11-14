Rails.application.routes.draw do
  resources :feeds do
   collection do
     post :confirm
   end
  end
  resources :users
  resources :favorites, only:[:create, :destroy, :index, :show]
  resources :sessions, only:[:new, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letters" if Rails.env.development?
end
