class ProfilesController < ApplicationController
  def check_profile
    #TODO: get user id from session
    @current_profile = Profile.find_by(user_id: 3)
    if @current_profile == nil
      flash[:warning] = 'no profiles found'
      redirect_to new_profile_path
      return
    else
      redirect_to show_profile_path
      #flash[:warning] = 'lalala'
    end
  end


  def new

  end

  def show
    #TODO: get user id from session
    @user_profile = Profile.find_by(user_id: 1)
     render json: @user_profile
  end

  #this actions is used to save the form submitted to db
  def create
    #render plain: params[:profiles].inspect
    @profile = Profile.new(profile_params)
    @profile.save()
    render json: @profile
  end

  private

  def profile_params
    #TODO: handle user no input case
    params.require(:profiles).permit(:address, :phone_num, :gender)
    #params.require(:profiles).permit(:address, :phone_num)
  end





end
