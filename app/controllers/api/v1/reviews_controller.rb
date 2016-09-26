class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token
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
        review: params[:text]
      )
    else
      Review.create(
        user_id: current_user.id,
        movie_id: params[:movie_id],
        rating: params[:rating],
        review: params[:review]
      )
    end
    @reviews = Review.all
    @review = Review.find(params[:review_id])
    render 'show'
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def edit
    @reviews = Review.find_by(id: params[:id])
    @movie = Movie.find_by(id: @reviews.movie_id)
  end

  def update
    @reviews = Review.find_by(id: params[:id])
    @reviews = Review.update(
      rating: params[:rating],
      review: params[:reivew]
    )
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
  end

  def search
    @reviews = current_user.Review.where(id: params[:id])
  end
end