class TimeslotController < ApplicationController
  def display
    contract = Contract.find_by(id: params[:contract_id])
    @job = contract.job
    @timeslots = contract.timeslots

  end

  def add
    timeslot_p = params[:timeslot]
    d = Date.parse(timeslot_p[:date_time_begin])
    t = Time.parse(timeslot_p[:time_begin])
    dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)


    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.save
    @timeslot.update(date_time_begin: dt)
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

  def redo
    timeslot_p = params[:timeslot]

    d = Date.parse(timeslot_p[:date_time_begin])
    t = Time.parse(timeslot_p[:time_begin])
    dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)

    timeslot = Timeslot.find_by(id: timeslot_p[:timeslot_id])
    
    timeslot.update(date_time_begin: dt,
                    time_length: timeslot_p[:time_length], approve_status: 0, paid_time: nil)
    redirect_to show_timeslot_path
  end

  def approve
    @timeslot = Timeslot.find_by(id: params[:timeslot_id])
    if params[:Approve]
      Timeslot.where(id: params[:timeslot_id]).update_all(approve_status: 1, paid_time: Time.now)
      #redirect_to update_timeslot_path
      redirect_to @timeslot.paypal_url(params[:timeslot_id], update_timeslot_path)
    else
      Timeslot.where(id: params[:timeslot_id]).update_all(approve_status: 2)
      redirect_to update_timeslot_path
    end
  end

  def reject
    Timeslot.where(id: params[:timeslot_id]).update_all(approve_status: 2)
    #redirect_to controller: 'timeslot', action: 'update', contract_id: params[:contract_id]
    redirect_to update_timeslot_path
  end

  def timeslot_params
    contract = Contract.find_by(id: params[:contract_id])
    params.require(:timeslot).permit(:date_time_begin, :time_length).
        merge(:contract_id => contract.id, :approve_status => 0, :paid_time => nil, :created_at => Time.now)
  end

end
