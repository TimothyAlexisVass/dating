class UserChurchResponsibilitiesController < ApplicationController
  before_action :set_user

  def create
    church_responsibility_ids = user_church_responsibility_params[:church_responsibility_id]
    church_responsibility_ids.each do |church_responsibility_id|
      item = @user.user_church_responsibilities.new(church_responsibility_id: church_responsibility_id)
      item.save
    end
    redirect_to user_path(@user.username)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_church_responsibility_params
    params.require(:user_church_responsibility).permit(church_responsibility_id: [])
  end
end
