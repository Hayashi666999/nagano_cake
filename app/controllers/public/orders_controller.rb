class Public::OrdersController < ApplicationController

def new
  @order = Order.new
end

def index
  @orders = Order.all
end

def show
  @order = Order.find(params[:id])
end

def confirm
  @order = Order.new(order_params)
  @order.postage = 800
  @cart_items = CartItem.where(customer_id: current_customer.id)
  if params[:order][:address_option] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name+current_customer.first_name

  elsif params[:order][:address_option] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end
end

def complete
end

def create
  @order = current_customer.orders.new(order_params)
  @order.status=0
  if @order.save!
  @cart_items = current_customer.cart_items
  @cart_items.each do |cart_item|
  @order_detail = OrderDetail.new
  @order_detail.order_id = @order.id
  @order_detail.item_id = cart_item.item.id
  @order_detail.purchase_price = cart_item.item.with_tax_price
  @order_detail.quantity = cart_item.amount
  @order_detail.making_status = 0
  @order_detail.save
  end
  @cart_item = current_customer.cart_items
  @cart_item.destroy_all

  redirect_to public_orders_complete_path
  end
end

private
def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :billing_amount)
end


end