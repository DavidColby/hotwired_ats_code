class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_applicant

  def index
    @emails = Email.where(applicant_id: params[:applicant_id]).with_rich_text_body.order(created_at: :desc)
  end
  
  def show
    @email = Email.find(params[:id])
    html = render_to_string(partial: 'email', locals: { email: @email })
    render operations: cable_car
      .inner_html('#slideover-content', html: html)
      .text_content('#slideover-header', text: @email.subject)
  end

  def new
    @email = Email.new
    html = render_to_string(partial: 'form', locals: { email: @email, applicant: @applicant })
    render operations: cable_car
      .inner_html('#slideover-content', html: html)
      .text_content('#slideover-header', text: "Email #{@applicant.name}")
  end

  def create
    @email = Email.new(email_params)
    @email.email_type = 'outbound'
    @email.applicant = @applicant
    @email.user = current_user

    if @email.save
      html = render_to_string(partial: 'shared/flash', locals: { level: :success, content: 'Email sent!' })
      render operations: cable_car
        .inner_html('#flash-container', html: html)
        .dispatch_event(name: 'submit:success')
    else
      html = render_to_string(partial: 'form', locals: { applicant: @applicant, email: @email })
      render operations: cable_car
        .inner_html('#email-form', html: html), status: :unprocessable_entity
    end
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:applicant_id])
  end

  def email_params
    params.require(:email).permit(:subject, :body)
  end
end
