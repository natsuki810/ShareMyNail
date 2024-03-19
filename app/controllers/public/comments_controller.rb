class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @design = Design.find(params[:design_id])
    @comment = Comment.new(comment_params)
    @comment.design_id = @design.id
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice_comment] = "投稿に成功しました"
      redirect_to design_path(@design.id)
    else
      flash[:notice_comment] = "投稿に失敗しました"
      redirect_to design_path(@design.id)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @design = Design.find(params[:design_id])
    if @comment.update(comment_params)
      flash[:notice_comment] = "投稿に成功しました"
      redirect_to design_path(@design.id)
    else
      flash[:notice_comment] = "投稿に失敗しました"
      redirect_to design_path(@design.id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to design_path(params[:design_id])
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
