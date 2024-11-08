Rails.application.routes.draw do
  # Health check routes - KEEP THESE!
  get '/healthz', to: 'health#check'
  get '/', to: 'health#check'

  # Authentication routes - Add these below the health routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Add this to see available routes
  get '/routes', to: proc { [200, {}, [Rails.application.routes.routes.map(&:path).join("\n")]] }
end