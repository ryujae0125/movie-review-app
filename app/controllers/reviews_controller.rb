class ReviewsController < ApplicationController
require 'pry'
  def index
    @reviews = Review.all
    @movies = Movie.all
  end

  def user_reviews
    @reviews = current_user.reviews.all
    @movies = Movie.all
  end

  def new
    @movie = Movie.find_by(id: params[:id])
  end

  def create
    review = Review.find_by(user_id: current_user.id, movie_id: params[:movie_id])
    if review
      review.update(
        rating: params[:rating],
        review: params[:review]
      )
    else
      Review.create(
        user_id: current_user.id,
        movie_id: params[:movie_id],
        rating: params[:rating],
        review: params[:review]
      )
    end
    redirect_to reviews_path
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def edit
    @reviews = Review.find_by(id: params[:id])
    @movie = Movie.find_by(id: @reviews.movie_id)
  end

  def update
    review = Review.find_by(id: params[:id])
    review.update(
      rating: params[:rating],
      review: params[:reivew]
    )
    redirect_to '/'
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  def search
    @reviews = current_user.Review.where(id: params[:id])
  end
end
