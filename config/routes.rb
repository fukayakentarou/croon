Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'explanation', to: 'explanations#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :movies, only: [:new, :show]
  resources :likes, only: [:create, :destroy]
  resources :reviews, only: [:index, :edit, :update, :create, :destroy]
  
  get 'rankings/like', to: 'rankings#like'
end
