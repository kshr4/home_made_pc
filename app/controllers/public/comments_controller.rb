class Public::CommentsController < ApplicationController
before_action :authenticate_customer!
  def create
    post = Post.find(params[:post_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.post_id = post.id
    @comment.save!
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_customer.id == @comment.post.customer_id
    @comment.destroy
    end
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end
