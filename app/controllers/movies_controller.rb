class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by(id: params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(
      name: params[:name],
      genre: params[:genre],
      date: params[:date],
      director: params[:director]
      favorite: false
      )
  end
end
