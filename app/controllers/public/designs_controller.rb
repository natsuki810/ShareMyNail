class Public::DesignsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    @design.user_id = current_user.id
    @design.save!
    redirect_to designs_path
  end

  def index
    @design = Design.new
    @designs = Design.all
  end
  
  def show
    @design = Design.find(params[:id])
    @color = Color.all
    @design.user_id = current_user.id
  end

  private

  def design_params
     params.require(:design).permit(:name, :introduction, :color_id, :image)
  end
end
