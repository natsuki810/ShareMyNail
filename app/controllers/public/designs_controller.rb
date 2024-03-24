class Public::DesignsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    @design.user_id = current_user.id
    if params["public"].present?
      @design.is_active = true
    else
      @design.is_active = false
    end
    if @design.save
      flash[:notice] = "投稿に成功しました"
      redirect_to design_path(@design)
    else
      render :new
    end
  end

  def index
    @design = Design.new
    @design_ranks = Design.joins(:favorites).where(is_active: true).group(:id).order("count(favorites.design_id) desc").limit(3)
    if params[:name]
      @designs = Design.where("name LIKE?", "%" + params[:name] + "%").or(Design.where("introduction LIKE ?", "%" + params[:name] + "%")).page.per(4).order(created_at: :desc).where(is_active: true)
    else
      @designs = Design.order(created_at: :desc).where(is_active: true).page(params[:page]).per(8)
    end
  end

  def show
    @design = Design.find(params[:id])
    if !@design.is_active && @design.user != current_user
      redirect_to designs_path
    end
    @color = Color.all
    @comments = @design.comments.order(created_at: :desc).page(params[:page]).per(3)
    @comment = Comment.where(design_id: @design.id)
    @reply = Reply.new
    @reply = Reply.order(created_at: :desc)
    reply_count = 0
    @design.comments.each do |comment|
      reply_count = reply_count + comment.replies.count
    end
    @total_comment = reply_count + @design.comments.count
  end

  def edit
    @design = Design.find(params[:id])
    if @design.user != current_user
      redirect_to  design_path
    end
  end

  def update
    @design = Design.find(params[:id])
    if @design.user != current_user
      redirect_to  design_path
    else
      if @design.update(design_params)
        flash[:notice] = "編集に成功しました"
        redirect_to design_path(params[:id])
      else
        render :edit
      end
    end
  end

  def destroy
    @design = Design.find(params[:id])
    if @design.user == current_user
      @design.destroy
      redirect_to users_designs_path(current_user) and return
    end
    redirect_to design_path(params[:id])
  end

  private
    def design_params
      params.require(:design).permit(:name, :introduction, :color_id, :image, :is_active)
    end
end
