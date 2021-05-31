class Api::V1::AdminUsersController < ApplicationController
  skip_forgery_protection

  def create
    @user = AdminUser.new(user_params)

    if @user.save
      render :create, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end 

  def login
    @user = AdminUser.find_by(email: params[:user][:email])
    if @user.present? && @user.valid_password?(params[:user][:password])
      sign_in @user
      render json: "{result: 'login success'}", status: :ok
    else
      render json: "{result: 'login fail'}", status: :unprocessable_entity
    end
  end 

  private

  def user_params
    params.require(:user).permit(:email, :password, :mobile_token)
  end
end
