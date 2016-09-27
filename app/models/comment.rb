class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  validates :comments, presence: true
end
