class FriendRequestsController < ApplicationController
  def new
    @recipient = User.find(params[:recipient_id])#basically this line is for assign the value of recipient_id in instance variable ..
    @friend_request = FriendRequest.new
  end

  def create
    received_request = FriendRequest.find(params[:id])
    if current_user.friends.include?(received_request.sender)
      redirect_to user_path, alert: "You are already friends with #{received_request.sender.name}."
    else
    @friend_request = FriendRequest.new(friend_request_params)
    @friend_request.sender_id = current_user.id # Assuming you're using Devise or similar for authentication

    if @friend_request.save
      redirect_to users_path, notice: 'Friend request sent successfully.'
    else
      flash.now[:error] = 'Error sending friend request.'
      render :new
    end
  end
  sender = received_request.sender

end
  def show
    @friend_request = FriendRequest.find(params[:id])
  end
  def received
    @received_requests = current_user.received_friend_requests
  end
  def accept
    received_request = FriendRequest.find(params[:id])

    if received_request.sender.present?
      sender = received_request.sender
      current_user.friendships.create(friend: sender, sender_name: sender.name)
      sender.friendships.create(friend: current_user, sender_name: current_user.name)

      received_request.destroy

      redirect_to friendship_index_path, notice: "Friend request accepted!"
    else
      redirect_to received_requests_path, alert: "Sender not found."
    end
  end


  private

  def set_recipient
    @recipient = User.find(params[:recipient_id])
  end

  def friend_request_params
    params.require(:friend_request).permit(:recipient_id,:sender_id)
  end
end
