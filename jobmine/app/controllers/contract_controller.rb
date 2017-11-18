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

  def contract_params
    params.permit(:job_id, :profile_id, :accept_status)
  end

end
