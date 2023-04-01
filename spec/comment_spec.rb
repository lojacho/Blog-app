require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }
  subject do
    first_post.comments.create(post: first_post, user_id: first_user.id, text: 'This is my first comment!',
                               author_id: first_user.id, author_type: 'User')
  end

  describe '#update_post_comments_counter' do
    it 'updates the comments counter of the associated post' do
      expect do
        subject.update_post_comments_counter
      end.to change { first_post.comments_counter }.from(0).to(1)
    end
  end
end
