class Admin::PostsController < ApplicationController
before_action :authenticate_admin!
  def index
    @posts =Post.all.page(params[:page]).per(5)
  end

  def show
    @post =Post.find(params[:id])
  end

  def edit
    @post =Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:profile_image, :cpu, :motherboard, :memory, :power_supply_unit, :computer_case, :hdd, :ssd, :cpu_cooler, :graphics_board, :total_price, :comment, :cpu_kind, :cpu_model_number)
  end


end
