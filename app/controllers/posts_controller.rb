class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Post updated hombre.'
      redirect_to @post
    else
      flash.now[:error] = 'Something is wrong with your form!'
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])

    if post.destroy
      flash[:success] = 'Problem solved! Post Deleted." in "nofilter New Post'
      redirect_to root_path
    else
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end