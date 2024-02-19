class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reports = Report.order(created_at: :desc)
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.status = true
    @report.update(params.permit(:status))
    redirect_to admin_reports_path
  end
  
  
  private
  def report_params
    params.require(:report).permit(:introduction, :status, :created_at)
  end
end
