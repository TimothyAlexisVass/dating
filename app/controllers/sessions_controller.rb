class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def signin
  end

  def create
    username_or_email = params[:session][:username_or_email].downcase

    if username_or_email.include?("@")
      user = User.find_by(email: username_or_email)
    else
      user = User.find_by(username: username_or_email)
    end
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      user.sign_in
      redirect_to user_path(user.username)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'signin'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private
  
  def sign_out
    @current_user.sign_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
