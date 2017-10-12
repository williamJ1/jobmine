class ProfilesController < ApplicationController
  #this is the page to display form to submit profile
  def new

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
