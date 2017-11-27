class TransactionSummaryController < ApplicationController
  def show
  	@cur_profile_id = params[:id]
    @user_profile = Profile.find_by(id: @cur_profile_id)
    @paid_transaction = []
    if @user_profile.user_type == 'teen'
    	Contract.where(profile_id: @cur_profile_id, accept_status: 2).all.each do |each_contract|
    		each_contract.timeslots.all.each do |each_timeslot|
    			if each_timeslot.paid_time.present?
    		        @paid_transaction.push(each_timeslot)
    		    end
    		end
    	end
    else
    	@user_profile.jobs.all.each do |each_job|
    	    accepted_contract = Contract.find_by(job_id: each_job.id, accept_status: 2)
    	    if accepted_contract.present?
    	    	accepted_contract.timeslots.all.each do |each_timeslot|
	    	    	if each_timeslot.paid_time.present?
	    	    		@paid_transaction.push(each_timeslot)
	    	    	end
    	        end   	    
    	    end
        end
    end
    
    @paid_transaction.sort!{ |x,y| y.paid_time.to_f<=>x.paid_time.to_f }

  end
end
