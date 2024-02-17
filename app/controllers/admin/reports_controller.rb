class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @report = Report.order(created_at: :desc)
  end
  
  private
  def report_params
    params.require(:report).permit(:introduction, :status, :created_at)
  end
end
