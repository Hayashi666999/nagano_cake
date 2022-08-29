  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def edit
    @books = Book.find(params[:id])
  end