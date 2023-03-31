require 'rails_helper'
require_relative '../app/models/comment'
require_relative '../app/models/post'
require_relative '../app/models/user'


RSpec.describe Comment, type: :model do
    let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }
  
    describe '#update_post_comments_counter' do
      it 'updates the comments counter of the associated post' do
        first_post.save
  
        subject { first_post.comments.create(user: first_user, text: 'This is my first comment!', author: first_user) }
  
        expect {
          subject.update_post_comments_counter
        }.to change { first_post.comments_counter }.from(0).to(1)
      end
    end
  end