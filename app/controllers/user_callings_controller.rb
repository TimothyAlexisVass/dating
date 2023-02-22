class UserCallingsController < ApplicationController
  before_action :set_user

  def create
    calling_ids = user_calling_params[:calling_id]
    calling_ids.each do |calling_id|
      item = @user.user_callings.new(calling_id: calling_id)
      item.save
    end
    redirect_to user_path(@user.username)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_calling_params
    params.require(:user_calling).permit(calling_id: [])
  end
end
