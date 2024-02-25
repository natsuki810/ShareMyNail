class Admin::ColorsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    if @color.save
      flash[:notice] = "投稿に成功しました"
      redirect_to admin_colors_path
    else
      flash[:notice] = "投稿に失敗しました"
      redirect_to admin_colors_path
    end
  end

  def index
    @color = Color.new
    @colors = Color.all
  end

  def destroy
    @color = Color.find(params[:id])
    @designs = Design.where(color_id: @color.id)
    @color.destroy
    if @designs.any?
      @designs.update(color_id: Color.find_by_name("その他").id)
    end
    redirect_to admin_colors_path
  end

  private

  def color_params
    params.require(:color).permit(:name)
  end
end
