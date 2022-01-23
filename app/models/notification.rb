class Notification < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user

  scope :unread, -> { where(read_at: nil) }

  serialize :params

  after_create_commit :update_users

  def to_partial_path
    'notifications/notification'
  end

  def update_users
    broadcast_replace_later_to(
      user,
      :notifications,
      target: 'notifications-container',
      partial: 'nav/notifications',
      locals: {
        user: user
      }
    )
  end

  def read!
    update_column(:read_at, Time.current)
  end
end
