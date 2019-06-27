Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'

  post 'message', to: 'messages#create'

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
