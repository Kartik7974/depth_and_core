Rails.application.routes.draw do
  # Health check routes
  get '/healthz', to: 'health#check'
  get '/', to: 'health#check'

  # Authentication routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end