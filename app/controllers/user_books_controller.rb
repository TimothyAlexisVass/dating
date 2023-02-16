class UserBooksController < ApplicationController
  before_action :set_user

  def create
    @user_book = @user.user_books.new(user_book_params)

    if @user_book.save
      redirect_to user_path(@user.username), flash: { success: "Book added successfully." }
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_book_params
    params.require(:user_book).permit(:book_id)
  end
end
