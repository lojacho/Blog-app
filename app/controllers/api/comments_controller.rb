class Api::CommentsController < ApplicationController
  def index
    @post = Post.find(request.params['post_id'])
    render :json => @post.comments.all
  end
end
