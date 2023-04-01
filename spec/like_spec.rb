require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }

  subject { first_post.likes.create(user: first_user, post: first_post) }

  describe '#update_likes_comments_counter' do
    it 'updates the likes counter of the associated comment' do
      expect do
        subject.update_post_likes_counter
      end.to change { first_post.likes_counter }.from(0).to(1)
    end
  end
end
