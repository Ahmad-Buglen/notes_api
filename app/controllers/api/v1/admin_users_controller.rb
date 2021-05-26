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

  def sign_in
    @user = AdminUser.find_by(email: params[:email])

    if @user && @user.valid_password?(params[:password])
      sign_in(:user, @user)
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end 

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
