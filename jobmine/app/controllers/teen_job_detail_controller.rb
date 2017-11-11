class TeenJobDetailController < ApplicationController
  def show
    @job_id = TeenJobDetail.find(params[:id])

    @job_detail = Job.find_by(id: @job_id)
    @employer_user = @job_detail.profile.user
    #the only way to find teen profile id is through session
    @cur_user_id = session[:current_user_id]
    @teen_profile = User.find_by(id: @cur_user_id).profile

    if Contract.where(:job_id => @job_id, :teen_profile_id => @teen_profile.id)
      @can_apply = true
    else
      @can_apply = false
    end
      #user_profile = Profile.find_by(user_id: @cur_user_id)
  end
end
