class TeenageJobController < ApplicationController
  def show_jobs
    @cur_user_id = session[:current_user_id]
    @user_obj = User.find_by(id: @cur_user_id)
    @user_profile = @user_obj.profile

    # open job are jobs has not
    @open_projects = []
    @cloased_peojects = []
    @my_on_goging_projects = []
    Job.all.each do |job_obj|
      if job_obj.contracts.size == 0
        @open_projects.push(job_obj)
      elsif job_obj.contracts.first.accept_status == 0
        @open_projects.push(job_obj)
      else
        @cloased_peojects.push(job_obj)
      end
    end

    my_onging_contracts = Contract.where(profile_id: @user_profile.id, accept_status: 2)
    my_onging_contracts.each do |constract_obj|
      @my_on_goging_projects.push(constract_obj.job)
    end

  end
end
