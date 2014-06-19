class JobsController < ApplicationController
  def index
    @jobs = Job.order(updated_at: :desc)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @new_job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :company_id)
  end
end





