class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @designs = Design.where(is_active: true).order(created_at: :desc).limit(4)
    @reports = Report.where(status: false).order(created_at: :desc)
    p "@@@@@@@@"
    p @reports
  end
end
