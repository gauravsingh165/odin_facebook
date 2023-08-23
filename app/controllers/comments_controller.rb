class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @comment=Comment.new
    end
    def create
      @post = Post.find( params[:comment][:post_id])
      @user = current_user
      @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
      if @comment.save
        redirect_to post_path(@post), notice: 'Comment added!'
      else
        redirect_to post_path(@post), alert: 'Could not add the comment.'
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to post_path(@comment.post), notice: 'Comment deleted!'
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content,:post_id)
    end
  end
  