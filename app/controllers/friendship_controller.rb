class FriendshipController < ApplicationController
    before_action :authenticate_user!
    def index
        @friends = current_user.friends
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
end
