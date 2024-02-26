class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments = Comment.all
    @Reply = Reply.all
    @array = []
    @array.push(@comments).push(@Reply).flatten!
    @array = @array.sort {|a,b| a.created_at <=> b.created_at}
    @array = @array.reverse
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

  def reports_comments_destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_reports_path
  end
end
