class UserBooksController < ApplicationController
  before_action :set_user

  def create
    item = @user.user_books.new(user_book_params)

    if item.save
      redirect_to user_path(@user.username)
    else
      redirect_to user_path(@user.username), flash: { danger: item.errors.full_message }
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
