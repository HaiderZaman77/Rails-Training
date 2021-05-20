class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :create, :destroy]
#posts
  # GET /posts or /posts.json
  def index
    @posts = @user.posts.all

  
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
  def edit

  end

  # POST /posts or /posts.json
  def create
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to user_post_path(@post,params[:user_id])
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to user_post_path(post,params[:user_id])
    else
      @comments = Comment.all
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    byebug
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

    def set_user
      @user = User.find(params[:user_id])
    end
end
