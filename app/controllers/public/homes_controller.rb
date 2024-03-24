class Public::HomesController < ApplicationController
  def top
    @designs = Design.where(is_active: true).order(created_at: :desc).limit(6)
    @count = 0
    @design_ranks = Design.find(Favorite.group(:design_id).order("count(design_id) desc").limit(3).pluck(:design_id))
  end
end
