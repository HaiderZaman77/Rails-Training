class PostsController < ApplicationController
  before_action :set_post, only: [:show]
#posts
  # GET /posts or /posts.json
  def index
    @posts = Post.all
  
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
    @post = Post.find(params[:id])

  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to posts_path
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to :action => 'show', :id => @post
    else
      @comments = Comment.all
      render :action => 'edit'
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_path
  end

  private

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :title, :content)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
