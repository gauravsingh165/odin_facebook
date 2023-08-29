class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_authorization, only: %i[edit update]
  def index
    @post = Post.all
    @user = current_user
  end
  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.build(post_params)
  
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to post_path(@post) # Redirect to the show page of the newly created post
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
      flash.now[:notice] = 'Post was successfully updated.'
      render turbo_stream: turbo_stream.replace(@post)
    else
      render :edit
    end
  end
  

  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all # Delete associated comments
    @post.likes.destroy_all    # Delete associated likes
    @post.destroy
  
    render turbo_stream: turbo_stream.remove(@post)
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
