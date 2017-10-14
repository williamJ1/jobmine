class LoginController < ApplicationController
  def new

  end

  def create
    @u = User.find_by(email: params[:login][:email])
    if @u == nil
      flash[:warning] = 'User does not exist, please sign up'
      redirect_to new_user_path

      return
    end

    if @u.try(:authenticate, params[:login][:password])
      session[:current_user_id] = @u.id
      redirect_to check_profile_path

      return
    else
      flash[:warning] = 'Wrong password'
      redirect_to login_path
    end

    @profile = Profile.find_by()

  end
end
