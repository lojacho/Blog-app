class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_user_posts_counter
    author.posts_counter = author.posts.count
    author.save
  end
  
end
