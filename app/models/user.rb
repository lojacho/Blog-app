class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :photo, format: {
    with: %r{\Ahttps?://(?:www\.)?(?:unsplash\.com|.*unsplash\.com)/photos/.*(?:\.(?:png|jpe?g|gif))?\z}i,
    message: 'must be a valid image URL from Unsplash'
  }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
