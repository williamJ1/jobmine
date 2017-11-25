class TimeslotController < ApplicationController
  def display
    contract = Contract.find_by(id: params[:contract_id])
    @job = contract.job
    @timeslots = contract.timeslots
  end

  def add
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.save
    redirect_to show_timeslot_path
  end

  def update
    contract = Contract.find_by(id: params[:contract_id])
    @job = contract.job
    @timeslots = contract.timeslots
    @pending_timeslots = @timeslots.where(approve_status: 0).all
    @approved_timeslots = @timeslots.where(approve_status: 1).all
    @rejected_timeslots = @timeslots.where(approve_status: 2).all
  end

  def approve
    Timeslot.where(id: params[:timeslot_id]).update_all(approve_status: 1)
    #redirect_to controller: 'timeslot', action: 'update', contract_id: params[:contract_id]
    redirect_to update_timeslot_path
  end

  def reject
    Timeslot.where(id: params[:timeslot_id]).update_all(approve_status: 2)
    #redirect_to controller: 'timeslot', action: 'update', contract_id: params[:contract_id]
    redirect_to update_timeslot_path
  end

  def timeslot_params
    contract = Contract.find_by(id: params[:contract_id])
    params.require(:timeslot).permit(:date_time_begin, :time_length).
        merge(:contract_id => contract.id, :is_approved => FALSE, :is_paid => FALSE)
  end

end
