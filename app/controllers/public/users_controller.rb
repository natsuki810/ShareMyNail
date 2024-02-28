class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @designs = @user.designs.order(created_at: :desc).limit(4)
    else
      @designs = @user.designs.where(is_active:true).order(created_at: :desc).limit(4)
    end
    @favorites = @user.favorites.order(created_at: :desc).limit(4)
  end

  def designs
    @user = User.find(params[:id])
    if @user == current_user
      @designs = @user.designs.order(created_at: :desc)
    else
      @designs = @user.designs.where(is_active:true).order(created_at: :desc)
    end
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
    if @user.update(user_params)
      flash[:notice] = "編集に成功しました"
      redirect_to users_mypage_path(@user)
    else
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  def confirm
    @user = current_user
  end

  def withdrawal
    @user = current_user
    @user.update(is_active: "false")
    reset_session
    redirect_to root_path, notice: "退会しました"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction)
  end
end
