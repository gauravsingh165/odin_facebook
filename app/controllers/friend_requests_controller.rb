class FriendRequestsController < ApplicationController
  def new
    @recipient = User.find(params[:recipient_id])
    @friend_request = FriendRequest.new
  end

  def create
    @friend_request = FriendRequest.new(friend_request_params)
    @friend_request.sender_id = current_user.id # Assuming you're using Devise or similar for authentication

    if @friend_request.save
      redirect_to users_path, notice: 'Friend request sent successfully.'
    else
      flash.now[:error] = 'Error sending friend request.'
      render :new
    end
  end
  
  def show
    @friend_request = FriendRequest.find(params[:id])
  end
  def received
    @received_requests = current_user.received_friend_requests
  end
  def accept
    puts "Received params: #{params.inspect}" # Add this line
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.update(status: 'accepted')
  
    redirect_to received_friend_requests_path, notice: 'Friend request accepted.'
  end
  private

  def set_recipient
    @recipient = User.find(params[:recipient_id])
  end

  def friend_request_params
    params.require(:friend_request).permit(:recipient_id)
  end
end
