require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tanjiro Kamado', photo: 'https://static.zerochan.net/Kamado.Tanjirou.full.2705519.jpg', bio: 'Friendly guy that leaves as a demon slayer.')
    @user2 = User.create(name: 'Nezuko Kamado', photo: 'https://static.zerochan.net/Kamado.Nezuko.full.2843321.jpg', bio: 'Tanjiro\'s younger sister who turns into a demon.')
    visit users_path
  end

  it 'shows the name of all the users' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  it 'shows the profile picture of each user' do
    expect(page).to have_selector("img[src*='#{@user.photo}']")
    expect(page).to have_selector("img[src*='#{@user2.photo}']")
  end

  it 'shows the number of posts each user has written' do
    expect(page).to have_content("Number of post: #{@user.posts.count}")
    expect(page).to have_content("Number of post: #{@user2.posts.count}")
  end

  it 'redirects me to that users page' do
    link = find("a[href='#{user_path(@user)}']")
    link.click
    expect(page).to have_current_path(user_path(@user))
  end
end