Rails.application.routes.draw do
  devise_for :users
  get '/' => 'movies#index'
  get '/movies' => 'movies#index'
  get '/movies/new' => 'movies#new'
  post '/movies' => 'movies#create'
  get '/movies/:id' => 'movies#show'
  get '/movies/:id/edit' => 'movies#edit'
  patch '/movies/:id' => 'movies#update'
  delete '/movies/:id' => 'movies#destroy'
  get '/search' => 'movies#search'
  get '/movies/compare' => 'movie#compare'

  get '/reviews' => 'reviews#index'
  get '/reviews/user_reviews' => 'reviews#user_reviews'
  get '/reviews/:id/new' => 'reviews#new'
  post '/reviews/:id' => 'reviews#create'
  get '/reviews/:id/edit' => 'reviews#edit'
  get '/reviews/:id' => 'reviews#show'
  patch '/reviews/:id' => 'reviews#update'
  delete '/reviews/:id' => 'reviews#destroy'



  get '/users/' => 'users#index'

  post '/favorite_movies' => 'favorite_movies#create'
  get '/favorite_movies' => 'favorite_movies#index'


  namespace :api do
    namespace :v1 do
      get '/' => 'movies#index'
      get '/movies' => 'movies#index'
      get '/movies/new' => 'movies#new'
      post '/movies' => 'movies#create'
      get '/movies/:id' => 'movies#show'
      get '/movies/:id/edit' => 'movies#edit'
      patch '/movies/:id' => 'movies#update'
      post '/destroy/:id' => 'movies#destroy'
      get '/search' => 'movies#search'
      get '/movies/compare' => 'movie#compare'

      get '/reviews' => 'reviews#index'
      get '/reviews/user_reviews' => 'reviews#user_reviews'
      get '/reviews/:id/new' => 'reviews#new'
      post '/reviews/:id' => 'reviews#create'
      post '/reviews/:id/review' => 'reviews#create_review'
      get '/reviews/:id/edit' => 'reviews#edit'
      get '/reviews/:id' => 'reviews#show'
      patch '/reviews/:id' => 'reviews#update'
      post '/reviews/destroy/:id' => 'reviews#destroy'

      get '/users/' => 'users#index'

      post '/favorite_movies' => 'favorite_movies#create'
      get '/favorite_movies' => 'favorite_movies#index'
    end
  end


end
