class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all.page(params[:page]).per(5)
  end

  def show
    @customers =Customer.find(params[:id])
  end

  def edit
    @customers =Customer.find(params[:id])
  end

  def update
    @customers =Customer.find(params[:id])
    @customers.update(customer_params)
    redirect_to admin_customers_path
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to admin_customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :id )
  end

end
