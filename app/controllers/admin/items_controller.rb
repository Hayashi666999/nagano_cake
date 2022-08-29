class Admin::ItemsController < ApplicationController
  
  def new
   @item = Item.new
  end
  
def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end
  
  def show
    @user=User.find(params[:id])
    @books = @user.books
  end
  
  def edit
    @user=User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end
  
end
