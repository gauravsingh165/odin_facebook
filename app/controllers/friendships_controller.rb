class FriendshipsController < ApplicationController
  def create
    # Find the user who is receiving the friend request
    receiver = User.find(params[:receiver_id,])

    # Create a new Friendship object
    @friendship = Friend_request.new(sender: current_user, receiver: receiver)

    if @friendship.save
      flash[:notice] = "Friend request sent."
    else
      flash[:error] = "Unable to send friend request."
    end
    redirect_to root_url
  end

  def destroy
    @friendship = Friendship.find(params[:id])

    if @friendship.sender == current_user || @friendship.receiver == current_user
      @friendship.destroy
      flash[:notice] = "Friendship removed."
    else
      flash[:error] = "You don't have permission to remove this friendship."
    end
    redirect_to root_url
  end
end
