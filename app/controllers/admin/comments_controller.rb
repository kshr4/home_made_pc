class Admin::CommentsController < ApplicationController
before_action :authenticate_admin!
  def destroy
    @comments = Comment.find(params[:id])
    @comments.destroy
    redirect_to admin_posts_path
  end

  def comment_params
    params.require(:comment).permit(:body)
  end


end
