class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 6)
  end

  def new
    @post = Post.new

  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)
    @post.save
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "DELETE"
  end

  private

    def post_params
       params.require(:post).permit(:name, :text)
    end

end
