class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    cur_user_id = session[:current_user_id]
    user_obj = User.find_by(id: cur_user_id)
    user_profile = user_obj.profile
    @user_profile = user_profile

    if user_profile.user_type == 'teen'
      # 4 different type of jobs for teen.
      # 1. jobs I can apply, job not has any contract or if has something, status must all be 0
      # 2. jobs I applied but waiting for approved
      # 3. onging jobs, jobs which I has a status = 1
      # 4. my closed jobs, jobs which I has a status = 3
      @open_and_not_applied_jobs = []
      @applied_but_waiting_jobs = []
      @my_on_goging_jobs = []
      @my_finished_jobs = []
      open_jobs = []
      cannot_apply_jobs = []
      Job.all.each do |job_obj|
        if job_obj.contracts.size == 0
          open_jobs.push(job_obj)
        elsif job_obj.contracts.first.accept_status == 0
          open_jobs.push(job_obj)
        else
          cannot_apply_jobs.push(job_obj)
        end
      end

      open_jobs.each do |open_job|
        if Contract.where(job_id: open_job.id, profile_id: user_profile.id).exists?
          @applied_but_waiting_jobs.push(open_job)
        else
          @open_and_not_applied_jobs.push(open_job)
        end
      end

      my_onging_contracts = Contract.where(profile_id: user_profile.id, accept_status: 2)
      my_onging_contracts.each do |constract_obj|
        @my_on_goging_jobs.push(constract_obj.job)
      end

      my_finished_contracts = Contract.where(profile_id: user_profile.id, accept_status: 3)
      my_finished_contracts.each do |constract_obj|
        @my_finished_jobs.push(constract_obj.job)
      end

      return
    end
    if user_profile.user_type == 'employer' # the follwing part are for emplyer
      @open_jobs = []
      @ongoing_jobs = []
      @finsihed_jobs = []
      jobs_created_by_me = user_profile.jobs
      jobs_created_by_me.each do |job_obj|
        if job_obj.contracts.size == 0
          @open_jobs.push(job_obj)
        elsif job_obj.contracts.first.accept_status == 0
          @open_jobs.push(job_obj)
        else
          # if the job has a contract status = 3, then finished , else it is a onging job
          if Contract.exists?(job: job_obj, accept_status: 3)
            @finsihed_jobs.push(job_obj)
          else
            @ongoing_jobs.push(job_obj)
          end
        end
      end
      return
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @cur_user_id = session[:current_user_id]
    @user_obj = User.find_by(id: @cur_user_id)
    @user_profile = @user_obj.profile

    if @user_profile.user_type == 'teen'
      render plain: "you can't create job because you are teenager "
      return
    end

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

    def find_contract_id_by_job(job_id)
      cur_user_id = session[:current_user_id]
      user_obj = User.find_by(id: cur_user_id)
      user_profile = user_obj.profile
      contract = Contract.where(profile_id: user_profile.id, job_id: job_id)
      return contract.first.id
    end

    def find_teen_profile_id_by_closed_job(job_id)
      contract = Contract.find_by(job_id: job_id, accept_status: 3)
      return contract.profile_id
    end

    def find_contract_id_by_closed_job(job_id)
      contract = Contract.find_by(job_id: job_id, accept_status: 3)
      return contract.id
    end
    helper_method :find_contract_id_by_job, :find_teen_profile_id_by_closed_job, :find_contract_id_by_closed_job
end
