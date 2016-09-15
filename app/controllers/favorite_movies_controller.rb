class FavoriteMoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_movies = current_user.favorite_movies
  end

  def create
    favorite_movies = FavoriteMovie.new(
      user_id: current_user.id,
      movie_id: params[:movie_id],
      favorited_at: Time.now
    )
    favorite_movies.save
    redirect_to '/'
  end

end
