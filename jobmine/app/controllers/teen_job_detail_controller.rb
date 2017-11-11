class TeenJobDetailController < ApplicationController
  def show
    @job_id = params[:id]

    @job_detail = Job.find_by(id: @job_id)
    @employer_user = @job_detail.profile.user
    #the only way to find teen profile id is through session
    @cur_user_id = session[:current_user_id]
    @teen_profile = User.find_by(id: @cur_user_id).profile

    #@existing_contract = Contract.where(:job_id => @job_id, :teen_profile_id => @teen_profile.id)
    @existing_contract = Contract.where(["job_id = ? and profile_id = ?", @job_id, @teen_profile.id])
    @existing_contract.empty? ? @can_apply = true : @can_apply = false
      #user_profile = Profile.find_by(user_id: @cur_user_id)
  end
end
