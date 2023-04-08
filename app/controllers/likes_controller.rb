class LikesController < ApplicationController
  def create
    @current_user = current_user
    @like = Like.new(like_params)
    if @like.save
      redirect_to user_posts_path(@current_user)
    else
      format.html { redirect_to @post }
    end
  end

  def like_params
    params.permit(:user_id, :post_id)
  end
end
