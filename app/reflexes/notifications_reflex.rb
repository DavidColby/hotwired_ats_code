class NotificationsReflex < ApplicationReflex
  def read
    notification = element.unsigned[:public]
    notification.read!
    update_notification_count
    morph :nothing
  end

  private

  def update_notification_count
    count = current_user.notifications.unread.count
    if count.positive?
      cable_ready.text_content(selector: '#notification-count', text: count)
    else
      cable_ready.remove(selector: '#notification-count')
    end
  end
end
