class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @designs = current_user.designs.order(created_at: :desc).limit(4)
    @favorites = Favorite.order(created_at: :desc).limit(4)
  end

  def designs
    @user = User.find(params[:id])
    @designs = @user.designs.order(created_at: :desc)
  end

  def comments
    @user = current_user
    @comments = @user.comments.order(created_at: :desc)
    @replies = @user.replies.order(created_at: :desc)

    @array = []
    @array.push(@comments).push(@replies).flatten!
    @array = @array.sort {|a,b| a.created_at <=> b.created_at}
    @array = @array.reverse
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
