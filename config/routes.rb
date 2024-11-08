Rails.application.routes.draw do
  root 'health#check'
  
  post '/signup', to: 'accounts#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/healthz', to: 'health#check'
  
  # Add this to see available routes
  get '/routes', to: proc { [200, {}, [Rails.application.routes.routes.map(&:path).join("\n")]] }
end