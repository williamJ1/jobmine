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
    @approved_timeslots = @timeslots.where(is_approved: true).all
    @pending_timeslots = @timeslots.where(is_approved: false).all
  end

  def approve
    Timeslot.where(id: params[:timeslot_id]).update_all(is_approved: true)
    #redirect_to controller: 'timeslot', action: 'update', contract_id: params[:contract_id]
    redirect_to update_timeslot_path
  end

  def reject
    Timeslot.where(id: params[:timeslot_id]).update_all(is_approved: true)
    #redirect_to controller: 'timeslot', action: 'update', contract_id: params[:contract_id]
    redirect_to update_timeslot_path
  end

  def timeslot_params
    contract = Contract.find_by(id: params[:contract_id])
    params.require(:timeslot).permit(:date_time_begin, :time_length).
        merge(:contract_id => contract.id, :is_approved => FALSE, :is_paid => FALSE)
  end

end
