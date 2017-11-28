class TransactionSummaryController < ApplicationController


  def show
    ##########
    #By Time
    ##########
  	@cur_user_id = params[:id]
    @user_profile = Profile.find_by(user_id: @cur_user_id)
    @paid_transaction = []
    if @user_profile.user_type == 'teen'
        #find all accepted contracts for teen
    	Contract.where(profile_id: @user_profile.id, accept_status: 2).all.each do |each_contract|
    		each_contract.timeslots.all.each do |each_timeslot|
                #find all paid timeslot for those contracts
    			if each_timeslot.paid_time.present?
    		        @paid_transaction.push(each_timeslot)
    		    end
    		end
    	end

    else
    	@user_profile.jobs.all.each do |each_job|
            #find the only one accepted contract for one job
    	    accepted_contract = Contract.find_by(job_id: each_job.id, accept_status: 2)
    	    if accepted_contract.present?
    	    	accepted_contract.timeslots.all.each do |each_timeslot|
                    #find all paid timeslot for that one contracts
	    	    	if each_timeslot.paid_time.present?
	    	    		@paid_transaction.push(each_timeslot)
	    	    	end
    	        end   	    
    	    end
        end
    end

    #sort by paid_time: newest to oldest
    @paid_transaction.sort!{ |x,y| y.paid_time.to_f<=>x.paid_time.to_f }


    ##########
    #By Job
    ##########

    @ongoing_jobs = []
    find_ongoing_jobs(@user_profile).each do |each_job|
        @ongoing_jobs.push(each_job)
    end
    
    @finished_jobs = []
    find_finished_jobs(@user_profile).each do |each_job|
        @finished_jobs.push(each_job)
    end

  end



  #method to find ongoing jobs(accepted_status = 2)
  def find_ongoing_jobs(profile)
    my_on_going_jobs = []
    if profile.user_type == 'teen'
        my_onging_contracts = Contract.where(profile_id: profile.id, accept_status: 2)
        my_onging_contracts.each do |constract_obj|
            my_on_going_jobs.push(constract_obj.job)
        end
    else
        my_jobs = profile.jobs
        my_jobs.each do |each_job|
            if Contract.find_by(job_id: each_job.id, accept_status: 2).present?
                my_on_going_jobs.push(each_job)
            end
        end
    end


    return my_on_going_jobs

  end



  #method to find finished jobs(accepted_status = 3)
  def find_finished_jobs(profile)
    my_finished_jobs = []
    if profile.user_type == 'teen'
        my_finished_contracts = Contract.where(profile_id: profile.id, accept_status: 3)
        my_finished_contracts.each do |constract_obj|
            my_finished_jobs.push(constract_obj.job)
        end
    else
        my_jobs = profile.jobs
        my_jobs.each do |each_job|
            if Contract.find_by(job_id: each_job.id, accept_status: 3).present?
                my_finished_jobs.push(each_job)
            end
        end
    end


    return my_finished_jobs

  end




  #find total earned/paid money for one job
  def total_money_for_job(job_id)
    total_money = 0
    accepted_contract = Contract.find_by(job_id: job_id, accept_status: 2)
    if accepted_contract.present?
        accepted_contract.timeslots.all.each do |each_timeslot|
            if each_timeslot.paid_time.present?
                total_money = total_money + each_timeslot.time_length * each_timeslot.contract.job.hour_rate
            end
        end
    end

    return total_money

   end



helper_method :find_ongoing_jobs, :total_money_for_job






end
