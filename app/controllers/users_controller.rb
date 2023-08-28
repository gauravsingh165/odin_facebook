class UsersController < ApplicationController
  def index
    @posts = current_user.posts
    if params[:search]
      @users = User.where("first_name LIKE ?", "%#{params[:search]}%")
    else
      @users = User.all
    end
  end
  def new
  end
  def create 

  end 
  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      # Handle the case where the user is not found
      flash[:error] = "User with ID #{params[:id]} not found."
      redirect_to root_path
    end
  end
  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:phone,:address,:work,:education,:profile_photo)
  end
end 