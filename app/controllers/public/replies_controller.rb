class Public::RepliesController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      flash[:notice_comment] = "投稿に成功しました"
      redirect_to design_path(@comment.design.id)
    else
      flash[:notice_comment] = "投稿に失敗しました"
      redirect_to root_path
    end
  end

  def update
    @reply = Reply.find(params[:id])
    @comment = Comment.find(params[:comment_id])
    if @reply.update(reply_params)
      flash[:notice_comment] = "投稿に成功しました"
      redirect_to design_path(@comment.design.id)
    else
      flash[:notice_comment] = "投稿に失敗しました"
      redirect_to design_path(@comment.design.id)
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @comment = Comment.find(params[:comment_id])
    @reply.destroy
    redirect_to design_path(@comment.design.id)
  end

  def replies_update
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      flash[:notice_comment] = "投稿に成功しました"
      redirect_to users_comments_path
    else
      flash[:notice_comment] = "投稿に失敗しました"
      redirect_to users_comments_path
    end
  end

  def replies_destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to users_comments_path
  end

  private
  def reply_params
    params.require(:reply).permit(:content, :comment_id)
  end

end
