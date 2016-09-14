Rails.application.routes.draw do
  devise_for :users
  get '/' => 'movies#index'
  get '/movies' => 'movies#index'
  get '/movies/new' => 'movies#new'
  post '/movies' => 'movies#create'
  get '/movies/:id' => 'movies#show'
  get '/movies/:id/edit' => 'movies#edit'
  patch '/movies/:id' => 'movies#update'
  post '/destroy/:id' => 'movies#destroy'
  get '/search' => 'movies#search'


  get '/users/' => 'users#index'
end
