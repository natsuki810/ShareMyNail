class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comment = Comment.order(created_at: :desc)
    @replies = Reply.order(created_at: :desc)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_design_path(@comment.design_id)
  end
  
  def comment_destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path(params[:id])
  end
end
