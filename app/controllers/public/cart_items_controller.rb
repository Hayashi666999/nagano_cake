class Public::CartItemsController < ApplicationController
  def index
  @cart_items = current_customer.cart_items
  @total = 0
  end

  def create
         @cart_item = CartItem.new(cart_item_params)
         @cart_item.customer_id = current_customer.id
      if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
         @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
         @cart_item.amount+= params[:cart_item][:item_id].to_i
         @cart_item.save
         redirect_to public_cart_items_path
      elsif @cart_item.save
           redirect_to public_cart_items_path
      else
           redirect_to root_path
      end
  end

  def update
       @cart_items = CartItem.find(params[:id])
       @cart_items.update(cart_item_params)
    redirect_to public_cart_items_path

  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end



private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end