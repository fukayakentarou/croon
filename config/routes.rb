Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'toppages#index'
  
  get 'explanation', to: 'explanations#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :movies, only: [:new, :show]
  resources :likes, only: [:create, :destroy]
  resources :reviews, only: [:index, :create, :destroy]
  
  get 'rankings/like', to: 'rankings#like'
end
