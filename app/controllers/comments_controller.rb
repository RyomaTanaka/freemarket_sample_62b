class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
  end

  def comment_params
    params.permit(:body)
end
