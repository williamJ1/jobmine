class PasswordResetController < ApplicationController
  before_action :get_user,   only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email])

    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to login_path
      #render json: "found email"
    else
      flash[:danger] = "Email address not found"
      redirect_to new_password_reset_path
      #render json: "no email"
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      flash[:success] = "Password has been reset."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless (@user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end


  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


end