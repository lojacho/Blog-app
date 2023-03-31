require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }

  describe 'validations:' do
    it 'validates the presence of title' do
      first_post.title = nil
      first_post.valid?
      expect(first_post.errors[:title]).to include("can't be blank")
    end

    it 'validates that title length max characters' do
      first_post.title = 'x' * 251

      expect(first_post).to_not be_valid
    end

    it 'validates that comments_counter is a non-negative integer' do
      first_post.comments_counter = -1

      expect(first_post).to_not be_valid
    end

    it 'validates the presence of likes_counter' do
      first_post.likes_counter = nil

      expect(first_post).to_not be_valid
    end
  end
end
