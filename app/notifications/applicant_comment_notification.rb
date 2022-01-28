class ApplicantCommentNotification < Notification
  def message
    "#{params[:user].name} mentioned you in a comment on #{params[:applicant].name}"
  end

  def url
    applicant_comments_path(params[:applicant])
  end
end
