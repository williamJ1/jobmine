class Timeslot < ApplicationRecord
  belongs_to  :contract



  def paypal_url(timeslot_id, return_path)
  	@timeslot = Timeslot.find_by(id: timeslot_id)
  	@contract = Contract.find_by(id: @timeslot.contract_id)
  	@job = @contract.job
  	values = {
  		business: "#{@contract.profile.user.email}",
  		cmd: "_xclick",
  		upload: 1,
  		return: "http://localhost:3000/#{return_path}",
  		invoice: id,
  		amount: @job.hour_rate,
  		item_name: "#{@job.name}_Timeslot#{@timeslot.id}",
  		item_number: @timeslot.id,
  		quantity: "#{@timeslot.time_length}"
  	}
  	"https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
