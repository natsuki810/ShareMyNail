class Public::DesignsController < ApplicationController
  before_action :authenticate_user!
  def new
    @design = Design.new
  end
  
  def create
    @design = Design.new(design_params)
    @design.save
    redirect_to designs_path
  end
  
  private
  def design_params
     params.require(:design).permit(:name, :introduction, :is_active, :image)
  end
end
