class UserChurchResponsibilitiesController < ApplicationController
  before_action :set_user

  def create
    @user_church_responsibility = @user.user_church_responsibilities.new(user_church_responsibility_params)

    if @user_church_responsibility.save
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_church_responsibility_params
    params.require(:user_church_responsibility).permit(:church_responsibility_id)
  end
end
