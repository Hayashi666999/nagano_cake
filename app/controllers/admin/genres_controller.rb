  class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def edit
    @books = Book.find(params[:id])
  end
  end