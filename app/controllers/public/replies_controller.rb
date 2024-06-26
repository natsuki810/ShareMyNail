class Public::RepliesController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.find(params[:comment_id])
    reply = Reply.new(reply_params)
    reply.user_id = current_user.id
    if reply.save
      flash[:notice_comment] = "投稿に成功しました"
      @design = @comment.design
      reply_count = 0
      @design.comments.each do |comment|
        reply_count = reply_count + comment.replies.count
      end
      @total_comment = reply_count + @design.comments.count
    else
      flash[:notice_comment] = "投稿に失敗しました"
    end
  end

  def update
    @reply = Reply.find(params[:id])
    @comment = Comment.find(params[:comment_id])
    if @reply.update(reply_params)
      flash[:notice_comment] = "更新に成功しました"
      # redirect_to designs_show_path(@comment.design.id)
      @design = @comment.design
      reply_count = 0
      @design.comments.each do |comment|
        reply_count = reply_count + comment.replies.count
      end
      @total_comment = reply_count + @design.comments.count

    else
      flash[:notice_comment] = "更新に失敗しました"
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @comment = Comment.find(params[:comment_id])
    if @reply.destroy
      flash[:notice_comment] = "削除しました"
      @design = @comment.design
      reply_count = 0
      @design.comments.each do |comment|
        reply_count = reply_count + comment.replies.count
      end
      @total_comment = reply_count + @design.comments.count
    else
      flash[:notice_comment] = "削除に失敗しました"
    end
  end

  def replies_update
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      flash[:notice_comment] = "更新に成功しました"
      redirect_to users_comments_path
    else
      flash[:notice_comment] = "更新に失敗しました"
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
