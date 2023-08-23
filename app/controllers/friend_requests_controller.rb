class FriendRequestsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_user!

    def create
      @user = User.find(params[:user_id])
      current_user.sent_friend_requests.build(receiver: @user)
      if current_user.save
        flash[:notice] = 'Friend request sent!'
      else
        flash[:error] = 'Unable to send friend request.'
      end
      redirect_to @user
    end
    
      def destroy
        @friendship = current_user.received_friendships.find(params[:id])
        @friendship.destroy
        flash[:notice] = "Declined friend request."
        redirect_to root_url
      end
end
