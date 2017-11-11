class ProfilesController < ApplicationController
  def check_profile
    #TODO: get user id from session
    @cur_user_id = session[:current_user_id]
    @current_profile = Profile.find_by(user_id: @cur_user_id)
    if @current_profile == nil
      flash[:warning] = 'no profiles found, please create new profile'
      redirect_to new_profile_path
      return
    else
      redirect_to show_profile_path(id: @cur_user_id)
    end
  end

  def new
    @profile = Profile.new()
  end

  def show
    @show_user_id = params[:id]
    @show_user_profile = Profile.find_by(user_id: @show_user_id)
    @show_user_type = @show_user_profile.user_type
    @cur_user_type = Profile.find_by(user_id: session[:current_user_id]).user_type
    #check if user has full access to profile
    if @show_user_type == @cur_user_type
      @full_access = true
    else
      @full_access = false
    end
    #TODO: add review and rating once review table is implemented
    #redirect_to new_job_path
  end

  def create
    @cur_user_id = session[:current_user_id]
    @profile = Profile.new(profile_params)
    if @profile.save()
      flash[:notice] = "Sign up successful"
      redirect_to show_profile_path(id: @cur_user_id)
    else
      flash[:alert] = "some thing went wrong with information : ("
      flash[:error] = @profile.errors.full_messages.join(";")
      redirect_to new_profile_path
    end

  end

  private

  def profile_params
    #TODO: handle user no input case
    #merge is used to add user id into table
    params.require(:profiles).permit(:address, :phone_num, :gender, :user_type).merge(:user_id => session[ :current_user_id])
  end


end
