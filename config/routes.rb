Rails.application.routes.draw do
  
  root 'users#new'

  # get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # root 'feeds#top'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/preference', to: 'preference#index'
  post '/preference', to: 'preference#save_session'

  resources :users
end