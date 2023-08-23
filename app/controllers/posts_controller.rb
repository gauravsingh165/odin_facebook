class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_authorization, only: %i[edit update]


  def index
    @post= Post.all
  end



  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.build(post_params) 
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])

  end

  def edit
    puts "Params ID: #{params[:id].inspect}"  # Debugging line
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end
  def like
    @post = Post.find(params[:id])
    @like = @post.likes.create(user_id: current_user.id)
    redirect_to post_path(@post)
  end

  def unlike
    @post = Post.find(params[:id])
    @like = @post.likes.find_by(user_id: current_user.id)
    @like.destroy if @like
    redirect_to post_path(@post)
  end
private

def post_params
  params.require(:post).permit(:content,:user_id,:title,:image)
end


end
