class Api::CommentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @post = Post.find(request.params['post_id'])
    render json: @post.comments.all
  end

  def create
    comment_params = params.require(:comment).permit(:user_id, :post_id, :text)
    # Aquí puedes usar los valores de name y email

    @user = User.find(comment_params[:user_id])
    @post = Post.find(comment_params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.author = @user
    @comment.user_id = @user.id
    @comment.author_type = 'User'
    if @comment.save
      render json: { status: 'Siuuuuuuuuuuuu' }
    else
      render json: { status: 'Nou' }
    end
  end
end
