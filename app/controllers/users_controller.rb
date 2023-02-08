class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    now = Time.now.to_date
    
    birth_date_lower = now.years_ago(@current_user.age_range_upper)
    birth_date_upper = now.years_ago(@current_user.age_range_lower)
    @users = User.all.where(gender: @current_user.searching_for).where(
      'birth_date >= ? and birth_date <= ?', birth_date_lower, birth_date_upper
    )
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    success = user.save
    if success
      session[:user_id] = user.id
      user.update_columns(is_active: true)
      redirect_to user_path(user.username), flash: { success: t(:sign_up_successful) }
    else
      redirect_to root_url, flash: { danger: user.errors.full_messages }
    end    
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, flash: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    if session[:user_id].present?
      @user = User.find(session[:user_id])
    else
      @user = nil
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :gender, :password, :birth_date, :first_name, :last_name, :rebirth_date)
  end
end
