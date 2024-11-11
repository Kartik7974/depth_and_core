Rails.application.routes.draw do
  # Health check routes - Keep these at the top
  get '/healthz', to: 'health#check'
  get '/', to: 'health#check'

  # Authentication routes
  resources :users, only: [:new, :create]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Add this to see available routes
  get '/routes', to: proc { [200, {}, [Rails.application.routes.routes.map(&:path).join("\n")]] }
end