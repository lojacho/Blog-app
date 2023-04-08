#require 'Pry'
class PostsController < ApplicationController
  # Renders the default view for the index action.
  def index
    @user = User.find(request.params['user_id'])
  end

  # Renders the default view for the show action.
  def show
    @post = Post.find(request.params['id'])
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.build(post_params)
#binding.pry
    if @post.save
      redirect_to user_posts_path(@current_user)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
