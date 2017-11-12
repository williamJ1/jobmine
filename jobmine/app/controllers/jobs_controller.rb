class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    @payments=Payment.all
  end

  def employer_index
    cur_user_id = session[:current_user_id]
    user_obj = User.find_by(id: cur_user_id)
    user_profile = user_obj.profile
    @open_jobs = []
    @ongoing_jobs = []

    jobs_created_by_me = user_profile.jobs

    # emplyer has their open jobs. jobs which has no contract or has contracts but all status = 0
    jobs_created_by_me.each do |job_obj|
      if job_obj.contracts.size == 0
        @open_jobs.push(job_obj)
      elsif job_obj.contracts.first.accept_status == 0
        @open_jobs.push(job_obj)
      else
        @ongoing_jobs.push(job_obj)
      end
    end
    # employer has their ongoing project. project has any contract = 1 or contract =2

    # emplyer has their cloased project.
  end
  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @cur_user_id = session[:current_user_id]
    @user_obj = User.find_by(id: @cur_user_id)
    @user_profile = @user_obj.profile

    if @user_profile.user_type == 'teen'
      render plain: "you can't create job because you are teenager "
      return
    end

    @job = Job.new(job_params)
    @job.profile = @user_profile
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
       format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:name, :description, :begin_date_time, :end_date_time, :location, :hour_rate)
    end
end
