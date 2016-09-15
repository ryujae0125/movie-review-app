class Movie < ActiveRecord::Base
  has_many :favorite_movies
  has_many :users, through: :favorite_movies
  has_many :reviews
end
