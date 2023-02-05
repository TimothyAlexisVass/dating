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
    if @user.save
      # Send confirmation email
      UserMailer.with(user: @user).confirm_email.deliver_later
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :gender, :birth_date, :first_name, :last_name, :rebirth_date)
  end
end
