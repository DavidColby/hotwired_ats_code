class InboundEmailNotification < Notification
  def message
    "#{params[:email].subject} from #{params[:applicant].name}"
  end

  def url
    applicant_email_path(params[:applicant], params[:email])
  end
end
