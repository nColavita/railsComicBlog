Rails.application.routes.draw do
  # You can have the root of your site routed with "root"

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  get '/news', to: 'posts#index'
  get '/list', to: 'users#index'

  resources :posts
  resources :users

  root 'home#index'
end
