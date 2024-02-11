class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @designs = Design.where(is_active: true).order(created_at: :desc).limit(4)
  end
end
