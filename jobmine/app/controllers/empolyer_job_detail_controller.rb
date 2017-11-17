class EmpolyerJobDetailController < ApplicationController
	def show
    @job_id = params[:id]

    @job_detail = Job.find_by(id: @job_id)
    #@cur_user_id = session[:current_user_id]

    @is_empty_contract = false
    @applied_teens = []

    if Contract.where(job_id: @job_id).exists?
      @contracts = Contract.where(job_id: @job_id)
      @contracts.each do |contract_obj| {
        if contract_obj.accept_status != 0
          flash[:alert] = "some thing went wrong with #{contract_obj}"
        end
        applied_teens.push(contract_obj.profile)
      }
    else
      @is_empty_contract = true
    end


  end
end
