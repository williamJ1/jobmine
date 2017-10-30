class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.save()
    #redirect_to '/profiles/new'
    if @user.save
      #flash[:notice] = "username/passwd saved! Please provide more info"
      flash[:notice] = "Please login in"
      redirect_to login_path
    else
      flash[:warning] = @user.errors
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
