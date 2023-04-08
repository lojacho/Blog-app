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
      # if @comment.save
      #   redirect_to user_post_pathuser_(user_id: @current_user.id, post_id: @post.id)
      # else
      #   render :new
      # end
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :text)
    end
  end