class UserSpiritualGiftsController < ApplicationController
  before_action :set_user

  def create
    spiritual_gift_ids = user_spiritual_gift_params[:spiritual_gift_id]
    spiritual_gift_ids.each do |spiritual_gift_id|
      item = @user.user_spiritual_gifts.new(spiritual_gift_id: spiritual_gift_id)
      item.save
    end
    redirect_to user_path(@user.username)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_spiritual_gift_params
    params.require(:user_spiritual_gift).permit(spiritual_gift_id: [])
  end
end
