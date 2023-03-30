class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: 'author_id'
  validates :photo, format: { with: %r{\Ahttps?://\S+\.(png|jpe?g|gif)\z}i, message: 'must be a valid image URL' }
end
