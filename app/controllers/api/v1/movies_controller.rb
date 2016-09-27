class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_user!
  def index
    @movies = Movie.all
    @favorite_movies = current_user.favorite_movies.order("favorited_at DESC").first(4)
    @tmovies = Tmdb::Discover.movie
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(
      title: params[:title],
      genre: params[:genre],
      date: params[:date],
      director: params[:director],
      actors: params[:actors],
      poster: params[:poster],
      language: params[:language]
      )
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.update(
      title: params[:title],
      genre: params[:genre],
      date: params[:date],
      director: params[:director],
      actors: params[:actors],
      poster: params[:poster],
      language: params[:language]
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
    render "search.html.erb"
  end

end
