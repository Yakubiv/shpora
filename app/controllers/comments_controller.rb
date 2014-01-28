class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def show
    @comment = current_user.comments.find(comment_params)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment == current_user
    @comment.destroy
    redirect_to post_path(@post)

  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body, :post_id)
  end
end
