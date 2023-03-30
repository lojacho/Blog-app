class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: 'author_id'
  validates :photo, format: {
    with: %r{\Ahttps?://(?:www\.)?(?:unsplash\.com|.*unsplash\.com)/photos/.*(?:\.(?:png|jpe?g|gif))?\z}i,
    message: 'must be a valid image URL from Unsplash'
  }
  
end
