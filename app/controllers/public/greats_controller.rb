class Public::GreatsController < ApplicationController
before_action :authenticate_customer!
  def create
    post = Post.find(params[:post_id])
    great = current_customer.greats.new(post_id: post.id)
    great.save
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    great = current_customer.greats.find_by(post_id: post.id)
    great.destroy
    redirect_to posts_path
  end

  def great_params
    params.require(:great)
  end

end
