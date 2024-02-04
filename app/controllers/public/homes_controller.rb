class Public::HomesController < ApplicationController
  def top
    @designs = Design.where(is_active: true).order(created_at: :desc)
  end
end
