class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[destroy edit update]

  def show
    @comments = @post.comments
  end

  def new
    @comment = Comment.new

  end

  def create
    @comment = @post.comments.create(comment_param)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = 'Comment Added'
      redirect_to user_post_path(current_user, @post)
    else

      flash[:notice] = 'Unable to add comment please try again'
    end

  end

  def update
    if @comment.update(comment_param)
      flash[:notice] = 'Comment Updated'
      redirect_to user_post_path(@post)
    else
      flash[:notice] = 'Unable to update the comment. Please try again'
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = 'Comment Deleted'
    redirect_to user_post_path(@post)
  end

  private

  def comment_param
    params.require(:comment).permit(:id, :commenter, :body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:post_id])
  end

end
