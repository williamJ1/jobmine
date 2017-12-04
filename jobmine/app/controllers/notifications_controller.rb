class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(recipient_id: session[:current_user_id])
  end
end
