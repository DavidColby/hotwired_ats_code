class UserInviteMailer < ApplicationMailer
  def invite(user)
    @user = user
    @inviting_user = user.invited_by
    mail(
      to: @user.email,
      subject: "#{@user.invited_by.name} wants you to join Hotwired ATS"
    )
  end
end
