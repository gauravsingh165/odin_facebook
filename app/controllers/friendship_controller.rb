class FriendshipController < ApplicationController
    before_action :authenticate_user!
    attr_accessor :sender_name

    def index
        @friends = current_user.friends
        @received_requests = current_user.received_friend_requests
        @accepted_friends = current_user.accepted_friends
        @friendships = current_user.friendships

      end
    def create
      friend = User.find(params[:friend_id])
      current_user.friends << friend
      redirect_to users_path, notice: 'Friend added!'
    end
  
    def destroy
      friendship = Friendship.find(params[:id])
      friendship.destroy
      redirect_to users_path, notice: 'Friend removed!'
    end
    def accepted_friends
      @accepted_friends = current_user.accepted_friends
    end
    def accept_friend_request
      friend_request = FriendRequest.find(params[:id])
      friend_request.accept!
  
      redirect_to received_friend_requests_path, notice: 'Friend request accepted!'
    end
end
