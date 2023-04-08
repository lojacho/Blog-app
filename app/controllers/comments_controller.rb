class CommentsController < ApplicationController
  def new
    @current_user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @current_user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.author = current_user
    @comment.user_id = current_user.id
    @comment.author_type = 'User'
    if @comment.save
      redirect_to user_post_path(@current_user, @post)
    else
      logger.debug @comment.errors.full_messages
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
