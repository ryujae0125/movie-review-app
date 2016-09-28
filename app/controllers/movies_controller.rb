class MoviesController < ApplicationController
  require 'unirest'
  before_action :authenticate_user!

  def index
    @movies = Movie.all
    @favorite_movies = current_user.favorite_movies.order("favorited_at DESC").first(4)
    popular_movies = Tmdb::Movie.popular.results
    top_movies = Tmdb::Movie.top_rated.results
    latest_movies = Tmdb::Movie.now_playing.results
    @pmovies = popular_movies.first(4)
    @tmovies = top_movies.first(4)
    @lmovies = latest_movies.first(4)
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @reviews = @movie.reviews
    @tmdb_movie = Tmdb::Search.movie("#{@movie.title}").results.first
    @treviews = Tmdb::Movie.reviews("#{@tmdb_movie.id}").results



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
    redirect_to movies_new_path
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
    @movies = Movie.where("LOWER(title) LIKE ?", "%#{params[:search].downcase}%")
    render "search.html.erb"
  end

end
