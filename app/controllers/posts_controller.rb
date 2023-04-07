class PostsController < ApplicationController
  # Renders the default view for the index action.
  def index
    @user = User.find(request.params['user_id'])
  end

  # Renders the default view for the show action.
  def show
    @post = Post.find(request.params['id'])
  end
end
