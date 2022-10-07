class JobsController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /jobs
  def index
    @jobs = Job.all

    render json: @jobs
  end

  # GET /jobs/1
  def show
    render json: @job
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:job_id])
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit(:job_title, :optional_requirements, :about_job,
                                :mandatory_requirements, :user_id,
                                :category_id, :min_salary, :max_salary)
  end
end
