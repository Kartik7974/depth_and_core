Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'signup', to: 'accounts#create'
  post 'login', to: 'logins#login'
  get '/healthz', to: 'health#check'
end
