class Public::DesignsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    @design.user_id = current_user.id
    @design.is_active = !!params[:public]
    if @design.save
       redirect_to design_path(@design)
    else
       render :new
    end
  end

  def index
    @design = Design.new
    @designs = Design.order(created_at: :desc).where(is_active: true)
  end

  def show
    @design = Design.find(params[:id])
    @color = Color.all
  end

  def edit
    @design = Design.find(params[:id])
    unless @design.user == current_user
      redirect_to  design_path
    end
  end

  def update
    @design = Design.find(params[:id])
    if @design.user != current_user
      redirect_to  design_path
    else
      if @design.update(design_params)
         redirect_to design_path
      else
        render :edit
      end
    end
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy
    redirect_to designs_path
  end
  private

  def design_params
     params.require(:design).permit(:name, :introduction, :color_id, :image, :is_active)
  end
end
