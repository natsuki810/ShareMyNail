class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @designs = Design.where(user_id:params[:id]).order(created_at: :desc).limit(4)
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
    @designs = Design.where(user_id:params[:id]).order(created_at: :desc)
  end

  private
  def user_params
  params.require(:user).permit(:name, :email, :is_active, :introduction)
  end
end
