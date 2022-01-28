class NotifyUserJob < ApplicationJob
  queue_as :default

  def perform(resource_id:, resource_type:, user_id:)
    resource = resource_type.constantize.find(resource_id)
    user = User.find(user_id)
    resource.create_notification(user)
  end
end
