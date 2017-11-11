class TeenageJobController < ApplicationController
  def show_jobs
    @job_id = TeenJobDetail.find(params[:id])

    @job_detail = Job.find_by(id: @job_id)
    @employer_user = @job_detail.profile.user
    #the only way to find teen profile id is through session
    @cur_user_id = session[:current_user_id]
    @teen_profile = User.find_by(id: @cur_user_id).profile



    #user_profile = Profile.find_by(user_id: @cur_user_id)
  end
end
