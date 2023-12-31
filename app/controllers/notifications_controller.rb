class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.received_notifications.order(created_at: :desc)
  end

  def mark_as_read
    notification = Notification.find(params[:id])
    notification.update(read_status: true)
    redirect_to notifications_path, notice: 'Notification marked as read.'
  end
end
