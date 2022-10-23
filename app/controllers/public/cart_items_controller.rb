class Public::CartItemsController < ApplicationController
  def index
  @cart_items = current_customer.cart_items
  @total = 0
  end

  def create
      if CartItem.find_by(item_id:cart_item_params[:item_id],customer_id:current_customer.id)
         @cart_item = CartItem.find_by(item_id:cart_item_params[:item_id],customer_id:current_customer.id)
         new_amount = @cart_item.amount+cart_item_params[:amount].to_i
         @cart_item.update(amount:new_amount)
         redirect_to public_cart_items_path
      else
         @cart_item = CartItem.new(cart_item_params)
        if @cart_item.save
           redirect_to public_cart_items_path
        else
           redirect_to root_path
        end
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