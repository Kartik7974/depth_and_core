Rails.application.routes.draw do
  root 'health#check'
  
  post '/signup', to: 'accounts#create'
  post '/login', to: 'logins#login'
  get '/healthz', to: 'health#check'
  
  # Add this to see available routes
  get '/routes', to: proc { [200, {}, [Rails.application.routes.routes.map(&:path).join("\n")]] }
end