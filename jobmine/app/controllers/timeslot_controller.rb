class TimeslotController < ApplicationController
  def display
    contract  = Contract.find_by(id: params[:contract_id])
    @job = contract.job
    @timeslots = contract.timeslots
  end

  def add
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.save
    redirect_to show_timeslot_path
  end


  def timeslot_params
    contract  = Contract.find_by(id: params[:contract_id])
    params.require(:timeslot).permit(:date_time_begin, :time_length).
        merge(:contract_id => contract.id, :is_approved => FALSE, :is_paid => FALSE)
  end
end
