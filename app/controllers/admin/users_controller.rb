class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @designs = Design.where(user_id:params[:id]).order(created_at: :desc).limit(4)
    @comments = @user.comments.order(created_at: :desc).limit(4)
    @replies = @user.replies.order(created_at: :desc).limit(4)
    @array = (@comments + @replies).sort {|a, b| b.created_at <=> a.created_at}.take(3)
    # @array = []
    # @array.push(@comments).push(@replies).flatten!
    # @array = @array.sort {|a,b| a.created_at <=> b.created_at}
    # @array = @array.reverse
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path
  end

  def designs
    @user = User.find(params[:id])
    @designs = Design.where(user_id:params[:id]).order(created_at: :desc)
  end

  def comments
    @user = User.find(params[:id])
    @comments = @user.comments.order(created_at: :desc).page(params[:page]).per(10)
    @replies = @user.replies.order(created_at: :desc)
    @array = (@comments + @replies).sort {|a, b| b.created_at <=> a.created_at}.take(4)
    @array = Kaminari.paginate_array(@array).page(params[:page]).per(5)
  end

  private
  def user_params
  params.require(:user).permit(:name, :email, :is_active, :introduction)
  end
end
