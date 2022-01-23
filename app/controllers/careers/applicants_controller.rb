class Careers::ApplicantsController < ApplicationController
  before_action :set_job

  def new
    html = render_to_string(partial: 'form', locals: { applicant: Applicant.new })
    render operations: cable_car
      .inner_html('#slideover-content', html: html)
      .text_content('#slideover-header', text: "#{@job.title} application")
  end

  def create
    @applicant = Applicant.new(applicant_params)
    @applicant.job = @job
    @applicant.stage = 'application'
    if @applicant.save
      html = render_to_string(partial: 'success', locals: { applicant: @applicant, job: @job })
      render operations: cable_car
        .inner_html('#slideover-content', html: html)
        .set_attribute('#apply-button', name: 'disabled', value: '')
    else
      html = render_to_string(partial: 'form', locals: { applicant: @applicant })
      render operations: cable_car
        .inner_html('#applicant-form', html: html), status: :unprocessable_entity
    end
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :email, :phone, :resume)
  end
end
