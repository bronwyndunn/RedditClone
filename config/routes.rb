Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :subs, only: [:index, :new, :create, :show, :update, :edit]
  resources :posts, only: [:new, :create, :show, :update, :edit]
end
