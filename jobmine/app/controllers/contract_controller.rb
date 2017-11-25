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

  def contract_params
    params.permit(:job_id, :profile_id, :accept_status)
  end

end
