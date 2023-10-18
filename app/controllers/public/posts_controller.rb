class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.where("cpu LIKE ?", "%#{params[:word]}%").page(params[:page]).per(5)

    # binding.pry
    #like:曖昧検索、?：#{params[:word]}が入っている。
    # @pages = Post.all.page(params[:page]).per(2)
    # @posts =Post.all
  end

  def tag
    @posts = Post.where(cpu_kind: params[:cpu_kind])
    render "index"
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @customer = current_customer

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_customer.posts.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to customers_path
  end

  def create
    @post = current_customer.posts.new(post_params)
    @post.save
    redirect_to customers_path

  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to customers_my_page_path
  end

  private
  def post_params
    params.require(:post).permit(:profile_image, :cpu, :motherboard, :memory, :power_supply_unit, :computer_case, :hdd, :ssd, :cpu_cooler, :graphics_board, :total_price, :comment, :cpu_kind, :cpu_model_number)
  end

end
