Rails.application.routes.draw do
  root to: 'discussions#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [ :new, :create, :show, :edit, :update, :destroy ]
  get 'users', to: 'users#new'
  
  resources :discussions do
    member do
      get :comment
    end
  end
  
  resources :comments, only: [ :create, :destroy ]
  
  resources :empathies, only: [ :create, :destroy ]
  resources :objections, only: [ :create, :destroy ]
  
  get 'auth/:provider/callback', to: 'callbacks#new_or_create'
  
end
