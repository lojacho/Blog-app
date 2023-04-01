require 'rails_helper'

RSpec.describe User, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }

  describe 'validations:' do
    it 'validates the presence of name' do
      first_user.name = nil
      first_user.valid?
      expect(first_user.errors[:name]).to include("can't be blank")
    end

    it 'validates that posts_counter is a non-negative integer' do
      first_user.posts_counter = -1
      expect(first_user).to_not be_valid
    end

    it 'validates the presence of post_counter' do
      first_user.posts_counter = nil
      expect(first_user).to_not be_valid
    end
  end

  describe 'Methods Functionality' do
    it 'returns the 3 most recent posts for an specific user' do
      _new_post1 = first_user.posts.create(author: first_user, title: 'Hello', text: 'This is my first post')
      _new_post2 = first_user.posts.create(author: first_user, title: 'Hello', text: 'This is my second post')
      _new_post3 = first_user.posts.create(author: first_user, title: 'Hello', text: 'This is my third post')
      _new_post4 = first_user.posts.create(author: first_user, title: 'Hello', text: 'This is my fourth post')
      recent_posts = first_user.recent_posts
      expect(recent_posts.size).to eq(3)
    end
  end
end
