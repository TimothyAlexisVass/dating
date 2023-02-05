class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    gender = current_user.gender == 'male' ? 'female' : 'male'
    @users = User.where(gender: gender).where('birth_date >= ?', current_user.age_range.begin).where('birth_date <= ?', current_user.age_range.end)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    success = @user.save
    if success
      redirect_to @user, flash: { success: "Signup successful!" }
    else
      redirect_to root_url, flash: { danger: ["Signup not successful!"].concat(@user.errors.full_messages) }
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
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :gender, :password_digest, :birth_date, :first_name, :last_name, :rebirth_date)
  end
end
