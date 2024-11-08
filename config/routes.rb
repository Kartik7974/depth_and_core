Rails.application.routes.draw do
  root 'health#check'
  
  post '/signup', to: 'accounts#create'
  post '/login', to: 'logins#login'
  get '/healthz', to: 'health#check'
end