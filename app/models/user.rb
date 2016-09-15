class User < ActiveRecord::Base
  has_many :favorite_movies
  has_many :movies, through: :favorite_movies
  has_many :addresses
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
