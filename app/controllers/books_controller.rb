class BooksController < ApplicationController
  # before_action :authenticate_user!
  def index
    # 空のモデル
    @book = Book.new
    # 全件取得して欲しい
    @books = Book.all
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      @books = Book.all
      render :show
    else
      @books = Book.all
      render :edit
    end
  end

  private
    def book_params
    params.require(:book).permit(:title, :body)
  end
end
