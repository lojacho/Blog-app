class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_create_commit :update_post_comments_counter

  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end  

  # Option 2: Working with the default #as_json method
  def as_json(options={})
   super({ only: [:text, :author_id, :post_id] }.merge(options))
 end
end
