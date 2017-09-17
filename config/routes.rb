Rails.application.routes.draw do
  
  root 'feeds#top'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users

  
  
end
