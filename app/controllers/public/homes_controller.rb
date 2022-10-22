class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    if params[:genre_id]
      genre = @genres.find(params[:genre_id])
      all_items = genre.items
    else
      all_items = Item.all
    end
    @items = all_items
  end
end
