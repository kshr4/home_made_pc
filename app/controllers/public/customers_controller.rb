class Public::CustomersController < ApplicationController
before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def my_page
    @posts = current_customer.posts.page(params[:page]).per(5)#ログインしているユーザーの投稿したデータが@postsに入っている。
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def my_greats_page
    @posts = current_customer.great_posts.page(params[:page]).per(5)
  end


  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana)
  end

end
