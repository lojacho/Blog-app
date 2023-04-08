class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @current_user = current_user
    @like = Like.new(like_params)
    return unless @like.save

    redirect_to user_posts_path(@current_user)
  end

  def like_params
    params.permit(:user_id, :post_id)
  end
end
