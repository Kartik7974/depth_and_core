Rails.application.routes.draw do
  root 'home#index'
  
  # User routes
  resources :users, only: [:new, :create]
  
  # Session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # Account routes (if needed)
  resources :accounts, only: [:create]
end