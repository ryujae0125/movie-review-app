Rails.application.routes.draw do
  devise_for :users
  get '/' => 'movies#index'
  get '/movies/new' => 'movies#new'
  post '/movies' => 'movies#create'
  get '/movies/:id' => 'movies#show'

  get '/users/' => 'users#index'
end
