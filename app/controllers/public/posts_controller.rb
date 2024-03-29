class Public::PostsController < ApplicationController
before_action :authenticate_customer!
  def new
    @post = Post.new
  end

  def index
    @posts = Post.where("cpu LIKE ?", "%#{params[:word]}%").page(params[:page]).per(5)
    #like:曖昧検索、?：#{params[:word]}が入っている。
  end

  def tag
    @posts = Post.where(cpu_kind: params[:cpu_kind]).page(params[:page]).per(5)
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
    if @post.update(post_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def create
    @post = current_customer.posts.new(post_params)
    if @post.save
      redirect_to customers_path
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    if current_customer.id == post.customer_id
      post.destroy
    end
      redirect_to customers_my_page_path
  end

  private
  def post_params
    params.require(:post).permit(:profile_image, :cpu, :motherboard, :memory, :power_supply_unit, :computer_case, :hdd, :ssd, :cpu_cooler, :graphics_board, :total_price, :comment, :cpu_kind, :cpu_model_number)
  end

end
