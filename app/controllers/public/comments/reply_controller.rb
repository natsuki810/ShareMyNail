class Public::Comments::ReplyController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.find(params[:reply][:comment_id])
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      redirect_to design_path(@comment.design.id)
    else
      redirect_to root_path
    end
  end

  def update
    @reply = Reply.find(params[:id])
    @reply.update
    redirect_to design_path(@comment.design.id)
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to design_path(params[:design_id])
  end

  private
  def reply_params
    params.require(:reply).permit(:reply, :comment_id).merge(comment_id: params[:reply][:comment_id])
  end

end
