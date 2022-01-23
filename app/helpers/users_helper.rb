module UsersHelper
  def user_invite_info(user)
    return "Signed up on #{l(user.created_at.to_date, format: :long)}" unless user.invited_by.present?
    
    if user.accepted_invite_at.present?
      "Signed up on #{l(user.accepted_invite_at.to_date, format: :long)}"
    else
      "Invited on #{l(user.invited_at.to_date, format: :long)}"
    end
  end
end
