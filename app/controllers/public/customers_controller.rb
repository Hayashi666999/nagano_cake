class Public::CustomersController < ApplicationController

  def show
    @customers = Customer.where(customer_id: current_customer.id)
  end

  def edit
    @customer = Customer.where(customer_id: current_customer.id)
  end

  def unsubscribe_confirm
    @customer = current_customer
  end

  def unsubscribe
      @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def update
　　　@customer = Customer.find(params[:id])
      @customer.update(cart_item_params)
    redirect_to public_customers_mypage_path
  end

end
