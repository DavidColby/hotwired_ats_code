class JobsController < ApplicationController
  include Filterable

  before_action :set_job, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @jobs = filter!(Job).for_account(current_user.account_id)
  end

  # GET /jobs/1 or /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    html = render_to_string(partial: 'form', locals: { job: Job.new })
    render operations: cable_car
      .inner_html('#slideover-content', html: html)
      .text_content('#slideover-header', text: 'Post a new job')
  end

  # GET /jobs/1/edit
  def edit
    html = render_to_string(partial: 'form', locals: { job: @job })
    render operations: cable_car
      .inner_html('#slideover-content', html: html)
      .text_content('#slideover-header', text: 'Update job')
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)
    @job.account = current_user.account
    if @job.save
      html = render_to_string(partial: 'job', locals: { job: @job })
      render operations: cable_car
        .prepend('#jobs', html: html)
        .dispatch_event(name: 'submit:success')
    else
      html = render_to_string(partial: 'form', locals: { job: @job })
      render operations: cable_car
        .inner_html('#job-form', html: html), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    if @job.update(job_params)
      html = render_to_string(partial: 'job', locals: { job: @job })
      render operations: cable_car
        .replace(dom_id(@job), html: html)
        .dispatch_event(name: 'submit:success')
    else
      html = render_to_string(partial: 'form', locals: { job: @job })
      render operations: cable_car
        .inner_html('#job-form', html: html), status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy
    render operations: cable_car.remove(selector: dom_id(@job))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :status, :job_type, :location, :account_id, :description)
    end
end
