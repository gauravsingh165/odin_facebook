class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post= Post.all
  end



  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.build(post_params) # Assuming you have a current_user method
    if @post.save
      redirect_to users_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])

  end

  def edit
  end
  def update
  end

  def destroy
  end

private

def post_params
  params.require(:post).permit(:content)
end
end
