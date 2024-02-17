class Admin::DesignsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @designs = Design.order(created_at: :desc)
  end
  
  def show
    @design = Design.find(params[:id])
    @color = Color.all
    @comment = Comment.where(design_id: @design.id)
    @reply = Reply.new
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
    @design.update(design_params)
    redirect_to admin_design_path(@design.id)
  end
  
  def destroy
    @design = Design.find(params[:id])
    @design.destroy
    redirect_to admin_designs_path
  end
  
  private

  def design_params
     params.require(:design).permit(:name, :introduction, :color_id, :image, :is_active)
  end
end
