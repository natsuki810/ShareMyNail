class Public::ReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @report = Report.new
    @design = Design.find(params[:design_id])
    @id = params[:content_id]
    @type = params[:type]
  end

  def create
    @report = Report.new(report_params)
    @design = Design.find(params[:design_id])
    @report.user_id = current_user.id
    if params[:type] == "design"
      @report.design_id = params[:content_id]
    elsif params[:type] == "comment"
      @report.comment_id = params[:content_id]
    else
      @report.reply_id = params[:content_id]
    end
    @report.save
    redirect_to design_path(@design)
  end

  private
    def report_params
      params.permit(:introduction)
    end
end
