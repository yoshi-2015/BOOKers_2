class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :show, :edit]
  def new
    @newbook = Book.new
  end
  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      flash[:notice] = "登録完了しました！Book was successfully created."
      redirect_to book_path(@newbook)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @newbook = Book.new
    # 全件取得して欲しい
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    else
      render :edit
    end
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "編集完了しました！Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "削除完了しました！Book was successfully destroyed."
    redirect_to books_path
  end

  private
    def book_params
    params.require(:book).permit(:title, :body)
    end
end