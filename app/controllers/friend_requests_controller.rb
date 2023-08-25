class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipient = User.find(params[:recipient_id])
    @friend_request = current_user.sent_friend_requests.build(recipient: @recipient)
  end
  def create
    recipient = User.find(params[:recipient_id])
    current_user.sent_friend_requests.create(recipient: recipient)
    redirect_to users_path, notice: 'Friend request sent!'
  end

  def accept
    request = FriendRequest.find(params[:id])
    current_user.friends << request.sender
    request.destroy
    redirect_to users_path, notice: 'Friend request accepted!'
  end

  def reject
    request = FriendRequest.find(params[:id])
    request.destroy
    redirect_to users_path, notice: 'Friend request rejected!'
  end
  def received
    @received_requests = current_user.received_friend_requests
  end
end
