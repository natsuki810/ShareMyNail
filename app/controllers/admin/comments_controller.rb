class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comment = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to admin_design_path(@comment.design_id)
  end
end
