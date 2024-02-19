class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @design = Design.find(params[:design_id])
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to design_path(@design.id)
  end

  def update
    @comment = Comment.find(params[:id])
    @design = Design.find(params[:design_id])
    @comment.update(comment_params)
    redirect_to design_path(@design.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to design_path(params[:design_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, design_id: @design.id)
  end

end
