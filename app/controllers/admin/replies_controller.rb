class Admin::RepliesController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to admin_design_path(@reply.comment.design.id)
  end
  
  def replies_destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to admin_comments_path(params[:id])
  end
end
