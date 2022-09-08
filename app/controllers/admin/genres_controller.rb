  class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
      if @genre.save
      redirect_to admin_genres_path
      else
      render :index
      end
  end

  def update
        @genre = Genre.find(params[:id])
    if @genres.update(books_params)
    redirect_to edit_admin_genre_path(@genres.id)
    else
   render :edit
    end
  end

private
def genre_params
      params.require(:genre).permit(:name)
end

  end