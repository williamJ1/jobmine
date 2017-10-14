class LoginController < ApplicationController
  def new

  end

  def create
    @u = User.find_by(email: params[:login][:email])
    if @u == nil
      flash[:warning] = 'User does not exist'
      redirect_to login_path

      return
    end

    if @u.try(:authenticate, params[:login][:password])
      redirect_to check_profile_path
      return
    else
      flash[:warning] = 'Wrong password'
      redirect_to login_path
    end

    @profile = Profile.find_by()

  end
end
