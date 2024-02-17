class Admin::RepliesController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @reply = Reply.find(params[:id])
    @comment = Comment.find(params[:comment_id])
    @reply.destroy
    redirect_to admin_design_path(@comment.design.id)
  end
end
