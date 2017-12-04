class ContractController < ApplicationController
  def create
    @my_contract = Contract.new(contract_params)
    if @my_contract.save
      #notify the employer that a teen has applied
      Notification.create(recipient: @my_contract.job.profile, actor: @my_contract.profile, action: "applied for job")

      flash[:notice] = "Apply successful"
      redirect_to jobs_path
    else
      flash[:notice] = "Apply failed"
      redirect_to jobs_path
    end
  end

  def close
    #check if there are pending timeslots related to this contract
    @pending_timeslots = Contract.find_by(id: params[:contract_id]).timeslots.where(approve_Status: 0).all
    if (!@pending_timeslots.blank?())
      flash[:notice] = "There are pending timeslots related to this contract, can not close!!"
      redirect_to controller: 'timeslot', action: 'update', contract_id: params[:contract_id]
    else
      #TODO: add code here to close contract
      Contract.find_by(id: params[:contract_id]).update(accept_status: 3)
      flash[:notice] = "Closed successful"
      #TODO: add code to redirect to employer home page if the current contract is closed
      #redirect_to controller: 'timeslot', action: 'update', contract_id: params[:contract_id]
      redirect_to jobs_path
    end
  end

  def update
    #find the contract to accept(only one)
    @contract_need_to_accept = Contract.find_by(job_id: params[:job_id], profile_id: params[:profile_id])
    if @contract_need_to_accept == nil
      flash[:error] = 'No contract exist for this job_id and profile_id, please check' 
      redirect_to jobs_path
    else 
      @contract_need_to_accept.accept_status = 2
      if @contract_need_to_accept.save
        Notification.create(recipient: @contract_need_to_accept.profile, actor: @contract_need_to_accept.job.profile, action: "accepted your application")
        #find other contracts for the same job_id need to reject(many)
        @contracts_need_to_reject = Contract.where(job_id: params[:job_id], accept_status: 0).all
        @contracts_need_to_reject.each do |cont|
          cont.accept_status = 1
          if cont.save
            Notification.create(recipient: cont.profile, actor: cont.job.profile, action: "rejected your application")
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
