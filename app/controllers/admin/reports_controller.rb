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
    if @report.update(params.permit(:status))
      flash[:notice] = "対応を完了しました"
      redirect_to admin_reports_path
    else
      lash[:notice] = "対応済にできませんでした"
      redirect_to admin_reports_path  
    end
  end
  
  
  private
  def report_params
    params.require(:report).permit(:introduction, :status, :created_at)
  end
end
