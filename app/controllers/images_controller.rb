class ImagesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.images.attach(params[:images])
    redirect_to user_path(@user.username)
  end
end
