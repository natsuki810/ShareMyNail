class Public::ReportsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @report = Report.new
  end
  
  def create
    @report = Report.new
    @design = Design.find(params[:id])
    @comment = Comment.find(params[:id])
    @report.save
    redirect_to design_path(@design)
  end
  
  private
  def report_params
     params.require(:report).permit(:user_id, :comment_id, :design_id, :introduction, :status)
  end
end
