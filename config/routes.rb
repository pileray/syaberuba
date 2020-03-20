Rails.application.routes.draw do
  root to: 'users#new'
  
  get 'signup', to: 'users#new'
  resources :users, only: [ :new, :create, :show, :edit, :update, :destroy ]
end
