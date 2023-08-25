class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = current_user.posts
    @users = @users.where("first_name LIKE ?", "%#{params[:search]}%") if params[:search].present?
  end
  def new
  end
  def create 

  end 
  def show
    @user = User.find(params[:id])

  end
  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:phone,:address,:work,:education,:profile_photo)
  end
end 