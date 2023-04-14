class Api::PostsController < ApplicationController
  def index
    @user = User.find(request.params['user_id'])
    render json: @user.posts.all
  end
end
