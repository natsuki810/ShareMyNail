# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました"
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    root_path
  end

  private
    def configure_sign_in_params
      @user = User.find_by(email: params[:user][:email])
      return if @user.nil?
      return unless @user.valid_password?(params[:user][:passwprd])
      if @user.is_active == false
        redirect_to new_user_registration_path
      end
    end
end
