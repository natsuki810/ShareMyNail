class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @design = Design.find(params[:design_id])
    @comment = Comment.new(comment_params)
    @comment.design_id = @design.id
    @comment.user_id = current_user.id
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

  def comments_update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to users_comments_path
  end

  def comments_destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to users_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
