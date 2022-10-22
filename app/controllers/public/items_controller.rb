class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    if params[:genre_id]
      genre = @genres.find(params[:genre_id])
      all_items = genre.items
    else
      all_items = Item.all
    end
    @items = all_items
  end

  def show
   @item = Item.find(params[:id])
  end

  def with_tax_price
    (price * 1.1).floor
  end

end