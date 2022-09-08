class Admin::ItemsController < ApplicationController

  def new
   @item = Item.new
  end

  def index
   @items = Item.all
  end

  def show

  end

    def create
    @item = Item.new(item_params)
      if @item.save
      redirect_to admin_items_path
      else
      render :index
      end
    end

  def edit
    @user=User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

private
def item_params
      params.require(:item).permit(:name,:image,:introduction,:genre_id,:price,:is_active)
end

end
