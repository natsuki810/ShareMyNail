class Admin::ColorsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    @color.save
    redirect_to admin_colors_path
  end

  def index
    @color = Color.new
    @colors = Color.all
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy
    redirect_to admin_colors_path
  end

  private

  def color_params
    params.require(:color).permit(:name)
  end
end
