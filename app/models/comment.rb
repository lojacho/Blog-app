class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create_commit :update_post_comments_counter

  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end

end
