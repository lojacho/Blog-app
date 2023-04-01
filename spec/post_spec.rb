require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }
  subject { first_user.posts.create(author: first_user, title: 'Hello', text: 'This is my second post') }
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

  describe '#update_user_posts_counter' do
    it 'updates the number of post by author' do
      expect do
        subject.update_user_posts_counter
      end.to change { first_user.posts_counter }.from(0).to(2)
    end
  end

  it 'returns the 5 most recent comments for the post' do
    _new_comment = first_post.comments.create(post: first_post, user_id: first_user.id,
                                              text: 'This is my first comment!', author_id: first_user.id, author_type: 'User') # rubocop:disable Layout/LineLength: Line is too long
    _new_comment2 = first_post.comments.create(post: first_post, user_id: first_user.id,
                                               text: 'This is my second comment!', author_id: first_user.id, author_type: 'User') # rubocop:disable Layout/LineLength: Line is too long
    _new_comment3 = first_post.comments.create(post: first_post, user_id: first_user.id,
                                               text: 'This is my third comment!', author_id: first_user.id, author_type: 'User') # rubocop:disable Layout/LineLength: Line is too long
    _new_comment4 = first_post.comments.create(post: first_post, user_id: first_user.id,
                                               text: 'This is my fourth comment!', author_id: first_user.id, author_type: 'User') # rubocop:disable Layout/LineLength: Line is too long
    _new_comment5 = first_post.comments.create(post: first_post, user_id: first_user.id,
                                               text: 'This is my fifth comment!', author_id: first_user.id, author_type: 'User') # rubocop:disable Layout/LineLength: Line is too long
    _new_comment6 = first_post.comments.create(post: first_post, user_id: first_user.id,
                                               text: 'This is my sixth comment!', author_id: first_user.id, author_type: 'User') # rubocop:disable Layout/LineLength: Line is too long
    recent_comments = first_post.recent_comments
    expect(recent_comments.size).to eq(5)
  end
end
