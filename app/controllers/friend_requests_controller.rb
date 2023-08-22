class FriendRequestsController < ApplicationController
    before_action :authenticate_user!

    def create
      @user = User.find(params[:user_id])
      current_user.send_friend_request_to(@user)
      redirect_to @user, notice: 'Friend request sent!'
    end
  
    def accept
      @user = User.find(params[:user_id])
      current_user.accept_friend_request_from(@user)
      redirect_to @user, notice: 'Friend request accepted!'
    end
  
    def decline
      @user = User.find(params[:user_id])
      current_user.decline_friend_request_from(@user)
      redirect_to @user, notice: 'Friend request declined.'
    end
end
