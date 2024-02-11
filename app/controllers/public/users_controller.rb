class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @designs = current_user.designs.order(created_at: :desc).limit(4)
  end

  def designs
    if params[:id] == current_user.id.to_s
       @designs = Design.where(user_id:params[:id]).order(created_at: :desc)
    else
       @designs = Design.where(user_id:params[:id]).order(created_at: :desc).where(is_active: true)
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_mypage_path
  end

  def confirm
    @user = current_user
  end

  def withdrawal
    @user = current_user
    @user.update(is_active: "false")
    reset_session
    redirect_to root_path, notice: 'Successfully withdraw from Ecommerce'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction)
  end
end
