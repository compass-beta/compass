Rails.application.routes.draw do
  
  root 'users#new'

  # get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/feed/all', to: 'feeds#top'
  get '/feed/base', to: 'feeds#base'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/preference', to: 'preference#index'
  get '/preference/search', to: 'preference#search'
  post '/preference', to: 'preference#save_session'

  resources :users
end