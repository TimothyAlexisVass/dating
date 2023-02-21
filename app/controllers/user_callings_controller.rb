class UserCallingsController < ApplicationController
  before_action :set_user

  def create
    @user_calling = @user.user_callings.new(user_calling_params)

    if @user_calling.save
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_calling_params
    params.require(:user_calling).permit(:calling_id)
  end
end
