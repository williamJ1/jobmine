class TeenJobDetailController < ApplicationController
  def show
    @job_id = TeenJobDetail.find(params[:id])

    @job_detail = Job.find_by(id: @job_id)
    @employer_user = @job_detail.profile.user


      #user_profile = Profile.find_by(user_id: @cur_user_id)
  end
end
