class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @design = Design.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.design_id = @design.id
    @comment.user_id = current_user.id
    @comments = @design.comments.order(created_at: :desc).page(params[:page]).per(3)
    if @comment.save
      flash[:notice_comment] = "投稿に成功しました"
      # redirect_to design_path(@design.id)
      @reply = Reply.order(created_at: :desc)
      reply_count = 0
      @design.comments.each do |comment|
        reply_count = reply_count + comment.replies.count
      end
      @total_comment = reply_count + @design.comments.count
    else
      flash[:notice_comment] = "投稿に失敗しました"
      # redirect_to design_path(@design.id)
    end
  end

  def update
    @comment = Comment.find(params[:comment][:id])
    @design = Design.find(params[:id])
    @comments = @design.comments.order(created_at: :desc).page(params[:page]).per(3)
    if @comment.update(comment_params)
      flash[:notice_comment] = "投稿に成功しました"
      # redirect_to design_path(@design.id)
      @reply = Reply.order(created_at: :desc)
      reply_count = 0
      @design.comments.each do |comment|
        reply_count = reply_count + comment.replies.count
      end
      @total_comment = reply_count + @design.comments.count
    else
      flash[:notice_comment] = "投稿に失敗しました"
      # redirect_to design_path(@design.id)
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    @design = Design.find(params[:id])
    @comments = @design.comments.order(created_at: :desc).page(params[:page]).per(3)
    # redirect_to design_path(params[:design_id])
    if @comment.destroy
        flash[:notice_comment] = "削除しました"
        # redirect_to design_path(@design.id)
        @reply = Reply.order(created_at: :desc)
        reply_count = 0
        @design.comments.each do |comment|
          reply_count = reply_count + comment.replies.count
        end
        @total_comment = reply_count + @design.comments.count
    else
      flash[:notice_comment] = "削除に失敗しました"
      # redirect_to design_path(@design.id)
    end
  end

  def comments_update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice_comment] = "投稿に成功しました"
      redirect_to users_comments_path
    else
      flash[:notice_comment] = "投稿に失敗しました"
      redirect_to users_comments_path
    end
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
