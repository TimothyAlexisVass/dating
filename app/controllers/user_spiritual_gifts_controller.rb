class UserSpiritualGiftsController < ApplicationController
  before_action :set_user

  def create
    @user_spiritual_gift = @user.user_spiritual_gifts.new(user_spiritual_gift_params)

    if @user_spiritual_gift.save
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_spiritual_gift_params
    params.require(:user_spiritual_gift).permit(:spiritual_gift_id)
  end
end
