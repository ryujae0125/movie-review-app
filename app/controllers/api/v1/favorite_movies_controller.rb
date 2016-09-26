class Api::V1::FavoriteMoviesController < ApplicationController
  skip_before_action :verify_authenticity_token

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

  def destroy
    @favorite_movie = FavoriteMovie.find_by(id: params[:id])
    @favorite_movie.destroy
    render '/favorite_movies'
  end

end
