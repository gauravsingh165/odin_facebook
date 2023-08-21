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
    params.require(:user).permit()
  end
end 