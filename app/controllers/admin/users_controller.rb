class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  private 
  def user_params
  params.require(:user).permit(:name, :email, :is_active, :introduction)
  end
end
