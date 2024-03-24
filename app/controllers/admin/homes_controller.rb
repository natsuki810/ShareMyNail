class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @designs = Design.where(is_active: true).order(created_at: :desc).limit(4)
    @reports = Report.where(status: false).order(created_at: :desc).limit(3)
    @comments = Comment.order(created_at: :desc).limit(4)
    @replies = Reply.order(created_at: :desc).limit(4)
    @array = (@comments + @replies).sort { |a, b| b.created_at <=> a.created_at }.take(3)
  end
end
