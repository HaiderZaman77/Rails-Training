class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  layout 'post', only: %i[create new show edit]
#posts
  # GET /posts or /posts.json
  def index
    if user_signed_in?
      @posts = current_user.posts.all
    else
      redirect_to new_user_session_path
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comment = @post.comments.new
    @comments = @post.comments
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.update(post_params)
    redirect_to user_posts_path(current_user)
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to  user_posts_path(params[:user_id])
  end

  private

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :title, :content, :user_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end


end
