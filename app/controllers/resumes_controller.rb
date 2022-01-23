class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_applicant, only: %i[show]

  def show
    @resume = @applicant.resume
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:applicant_id])
  end
end
