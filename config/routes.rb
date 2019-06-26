Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
