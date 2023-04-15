require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tanjiro Kamado', photo: 'https://static.zerochan.net/Kamado.Tanjirou.full.2705519.jpg',
                        bio: 'Friendly guy that leaves as a demon slayer.')
    @post = Post.create(author: @user, title: 'My first post',
                        text: 'This battle was agains my own sister that was converted to demon')
    @comment = Comment.create(author: @user, post: @post, text: 'Lorem ipsum', user_id: @user.id, author_id: @user.id,
                              author_type: 'user')
    @comment2 = Comment.create(author: @user, post: @post, text: 'Lorem ipsum2', user_id: @user.id,
                               author_id: @user.id, author_type: 'user')
    @comment3 = Comment.create(author: @user, post: @post, text: 'Lorem ipsum3', user_id: @user.id,
                               author_id: @user.id, author_type: 'user')
    @like = Like.create(user: @user, post: @post)
    @like2 = Like.create(user: @user, post: @post)
    visit user_post_path(@user, @post)
  end

  it 'Shows the title' do
    expect(page).to have_content(@post.title)
  end

  it 'Shows the name of the author' do
    expect(page).to have_content(@post.author.name)
  end

  it 'shows the number of comments on each post' do
    expect(page).to have_content("Comments: #{@post.comments.count}")
  end

  it 'shows the number of likes on each post' do
    expect(page).to have_content("Likes: #{@post.likes.count}")
  end

  it 'Shows the body of the post' do
    expect(page).to have_content(@post.text)
  end

  it 'Shows the name of the commenter' do
    expect(page).to have_content(@comment.author.name)
  end

  it 'Shows the body of the comment' do
    expect(page).to have_content(@comment.text)
  end
end
