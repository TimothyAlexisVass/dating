class UserLanguagesController < ApplicationController
  before_action :set_user

  def create
    @user_language = @user.user_languages.new(user_language_params)

    if @user_language.save
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_language_params
    params.require(:user_language).permit(:language_id)
  end
end
