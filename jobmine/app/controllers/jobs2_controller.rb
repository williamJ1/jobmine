class Jobs2Controller < ApplicationController
  
  #This controller is for employers
  def index
    @jobs2 = Job.all
  end
  
  def show
  end
  
  def new
    @job2 = Job.new
  end

  def edit
  end

  def create
    @job2 = Job.new(job_params)

    respond_to do |format|
      if @job2.save
        format.html { redirect_to @job2, notice: 'Job was successfully created.' }
       format.json { render :show, status: :created, location: @job2 }
      else
        format.html { render :new }
       # format.json { render json: @job2.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job2.update(job_params)
        format.html { redirect_to @job2, notice: 'Job was successfully updated.' }
       format.json { render :show, status: :ok, location: @job2 }
      else
        format.html { render :edit }
        format.json { render json: @job2.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job2.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
     # format.json { head :no_content }
    end
  end

  private
  def job2_params
      params.require(:job).permit(:name, :created_by_user, :description, :begin_date_time, :end_date_time)
  end
	
end
