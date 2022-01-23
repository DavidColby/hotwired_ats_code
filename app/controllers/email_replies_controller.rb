class EmailRepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_applicant

  def new
    @email = Email.new.build_reply(params[:email_id])
    @applicant = @email.applicant
    html = render_to_string(partial: 'emails/form', locals: { email: @email, applicant: @applicant })
    render operations: cable_car
      .inner_html('#slideover-content', html: html)
      .text_content('#slideover-header', text: "Email #{@applicant.name}")
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:applicant_id])
  end
end
