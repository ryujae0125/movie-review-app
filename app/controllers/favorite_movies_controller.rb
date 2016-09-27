class FavoriteMoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_movies = current_user.favorite_movies
  end

  def create
    favorite_movie = FavoriteMovie.find_by(
      user_id: current_user.id,
      movie_id: params[:movie_id],
    )
    binding.pry
    if favorite_movie
      favorite_movie.destroy
    else
      favorite_movie = FavoriteMovie.create(
        user_id: current_user.id,
        movie_id: params[:movie_id],
        favorited_at: Time.now
      )
    end
    redirect_to '/movies'
  end

  def destroy
    @favorite_movie = FavoriteMovie.find_by(id: params[:id])
    @favorite_movie.destroy
    render '/favorite_movies'
  end

end
