class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @design = Design.find(params[:design_id])
    @favorite = current_user.favorites.new(design_id: @design.id)
    @favorite.save
    redirect_to design_path(@design)
  end

  def destroy
    @design = Design.find(params[:design_id])
    @favorite = current_user.favorites.find_by(design_id: @design.id)
    @favorite.destroy
    redirect_to design_path(@design)
  end

  def index
    @user = User.find(params[:user_id])
    @favorites = Favorite.where(user_id: params[:user_id]).order(created_at: :desc)
  end
end
