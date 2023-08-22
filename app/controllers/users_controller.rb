class UsersController < ApplicationController
  def index
    @posts = current_user.posts 
  end
  def new
  end
  def create 

  end 

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:phone)
  end
end 