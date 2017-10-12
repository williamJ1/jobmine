class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save()
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end