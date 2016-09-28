class Movie < ActiveRecord::Base
  has_many :favorite_movies
  has_many :users, through: :favorite_movies
  has_many :reviews

  def calc_avg_rating
    reviews = Review.where(movie_id: id)
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    average_rating = sum / reviews.count
    return average_rating
  end

end
