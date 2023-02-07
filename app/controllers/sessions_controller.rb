class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def signin
  end

  def create
    username_or_email = params[:session][:username_or_email].downcase
    user = if username_or_email.include?("@")
      User.find_by(email: username_or_email)
    else
      User.find_by(username: username_or_email)
    end
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'sign_in'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private
  
  def sign_in(user)
    session[:user_id] = user.id 
    user.is_active = true 
  end
  
  def sign_out
    session.delete(:user_id)
    @current_user.is_active = false
    @current_user = nil
  end
  
end
