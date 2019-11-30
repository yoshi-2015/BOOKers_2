class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :show]

  def index
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to books_path
    else
      render :edit
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
    def user_params
    params.require(:user).permit(:name, :email, :profile_image_id, :introduction)
  end
end