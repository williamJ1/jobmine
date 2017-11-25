class ContractController < ApplicationController
  def create
    @my_contract = Contract.new(contract_params)
    if @my_contract.save
      flash[:notice] = "Apply successful"
      redirect_to jobs_path
    else
      flash[:notice] = "Apply failed"
      redirect_to jobs_path
    end
  end

  def close
    #check if there are pending timeslots related to this contract
    @pending_timeslots = Contract.find_by(id: params[:contract_id]).timeslots.where(is_approved: false).all
    if (!@pending_timeslots.blank?())
      flash[:notice] = "There are pending timeslots related to this contract, can not close!!"
      redirect_to controller: 'timeslot', action: 'update', contract_id: params[:contract_id]
    else
      #TODO: add code here to close contract
      flash[:notice] = "Closed successful"
      #TODO: add code to redirect to employer home page if the current contract is closed
      redirect_to controller: 'timeslot', action: 'update', contract_id: params[:contract_id]
    end
  end

  def update
    @contract_need_to_accept = Contract.find_by(job_id: params[:job_id], profile_id: params[:profile_id])
    if @contract_need_to_accept == nil
      flash[:error] = 'No contract exist for this job_id and profile_id, please check' 
      redirect_to jobs_path
    else 
      @contract_need_to_accept.accept_status = 2
      if @contract_need_to_accept.save
        @contracts_need_to_reject = Contract.where(job_id: params[:job_id], accept_status: 0).all
        @contracts_need_to_reject.each do |cont|
          cont.accept_status = 1
          if cont.save
            flash[:notice] = "Accept successful"
          else
            flash[:notice] = "Reject others failed"
            redirect_to jobs_path
          end
        end
        redirect_to jobs_path
      else 
        flash[:notice] = "Accept failed"
        redirect_to jobs_path
      end
    end
  end


  def contract_params
    params.permit(:job_id, :profile_id, :accept_status)
  end

end
