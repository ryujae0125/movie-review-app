class Api::V1::FavoriteMoviesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @favorite_movies = current_user.favorite_movies
  end

  def create
    if params[:favorite] == 1
      FavoriteMovie.create(
        user_id: current_user.id,
        movie_id: params[:movie_id],
        favorited_at: Time.now
      )
    render json: {success: "Movie favorited!"}
    else
      favorite = FavoriteMovie.find_by(
        user_id: current_user.id,
        movie_id: params[:movie_id]
      )
      favorite.destroy
    render json: {success: "Movie removed from favorites!"}
    end
  end

end
