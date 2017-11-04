class ProfilesController < ApplicationController
  def check_profile
    #TODO: get user id from session
    @cur_user_id = session[:current_user_id]
    @current_profile = Profile.find_by(user_id: @cur_user_id)
    if @current_profile == nil
      flash[:warning] = 'no profiles found'
      redirect_to new_profile_path
      return
    else
      redirect_to show_profile_path
    end
  end

  def new

  end

  def show
    @cur_user_id = session[:current_user_id]
    @user_profile = Profile.find_by(user_id: @cur_user_id)
    #TODO: add review and rating once review table is implemented
     #render json: @user_profile
  end

  #this actions is used to save the form submitted to db
  def create
    @cur_user_id = session[:current_user_id]
    @profile = Profile.new(profile_params)
    @profile.save()
    redirect_to show_profile_path
  end

  private

  def profile_params
    #TODO: handle user no input case
    #merge is used to add user id into table
    params.require(:profiles).permit(:address, :phone_num, :gender, :user_type).merge(:user_id => session[ :current_user_id])
  end


end
