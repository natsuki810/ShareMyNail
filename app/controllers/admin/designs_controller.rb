class Admin::DesignsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @design_ranks = Design.find(Favorite.group(:design_id).order('count(design_id) desc').limit(3).pluck(:design_id))
    if params[:name]
      @designs = Design.where("name LIKE ?", '%' + params[:name] + '%').or(Design.where("introduction LIKE ?", '%' + params[:name] + '%')).page.per(4).order(created_at: :desc)
    else
      @designs = Design.order(created_at: :desc).page(params[:page]).per(8)
    end
  end

  def show
    @design = Design.find(params[:id])
    @color = Color.all
    @comments = @design.comments.order(created_at: :desc).page(params[:page]).per(3)
    @comment = Comment.where(design_id: @design.id)
    @reply = Reply.new
    @reply = Reply.order(created_at: :desc)
    reply_count = 0
    @design.comments.each do |comment|
      reply_count = reply_count + comment.replies.count
    end
    @total_comment = reply_count + @design.comments.count
  end

  def edit
    @design = Design.find(params[:id])
  end

  def update
    @design = Design.find(params[:id])
    if @design.update(design_params)
      flash[:notice] = "投稿に成功しました"
      redirect_to admin_design_path(@design.id)
    else
      render :edit
    end
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy
    redirect_to admin_designs_path
  end

  def design_destroy
    @design = Design.find(params[:id])
    @design.destroy
    redirect_to admin_reports_path
  end

  private

  def design_params
     params.require(:design).permit(:name, :introduction, :color_id, :image, :is_active)
  end
end
