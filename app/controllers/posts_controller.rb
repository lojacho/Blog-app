class PostsController < ApplicationController
  load_and_authorize_resource
  # Renders the default view for the index action.
  def index
    @user = User.find(request.params['user_id'])
  end

  # Renders the default view for the show action.
  def show
    @post = Post.find(request.params['id'])
    @current_user = current_user
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.create(post_params)
    if @post.save
      redirect_to user_posts_path(@current_user)
    else
      render :new
    end
  end

  def destroy
    puts 'DESTROY POST'
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @post.destroy
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
