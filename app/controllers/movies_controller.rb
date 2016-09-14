class MoviesController < ApplicationController
  before_action :authenticate_user!
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
      director: params[:director],
      favorite: false
      )
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.update(
      name: params[:name],
      genre: params[:genre],
      date: params[:date],
      director: params[:director],
    )
    render 'edit'
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy

    redirect to '/'
  end

  def search
    @movies = Movie.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    render "index.html.erb"
  end

  
end
