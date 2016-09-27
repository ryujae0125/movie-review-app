class Api::V1::CommentsController < ApplicationController
  def create
    comment = Comment.new(
      comments: params[:comments],
      review_id: params[:review_id],
      user_id: current_user.id
    )
    if comment.save
      @review = comment.review
      render 'create'
    else
      render json: { error: "Comment can't be blank" }, status: 422
    end
  end

  def update
    comment = Comment.find_by(id: params[:id])
    if comment.update(comments: params[:comments])
      @review = comment.review
      render 'create'
    else
      render json: {error: "Comment can't be blank"}
    end
  end
end
