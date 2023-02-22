class UserLanguagesController < ApplicationController
  before_action :set_user

  def create
    language_ids = user_language_params[:language_id]
    language_ids.each do |language_id|
      item = @user.user_languages.new(language_id: language_id)
      item.save
    end
    redirect_to user_path(@user.username)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_language_params
    params.require(:user_language).permit(language_id: [])
  end
end
