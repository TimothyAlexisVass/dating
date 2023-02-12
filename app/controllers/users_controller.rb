class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    now = Time.now.to_date

    birth_date_lower = now.years_ago(@current_user.age_range_upper)
    birth_date_upper = now.years_ago(@current_user.age_range_lower)
    @users = User.all.where(gender: @current_user.searching_for).where(
      'birth_date >= ? and birth_date <= ?', birth_date_lower, birth_date_upper
    )

    @users = @users.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @user = User.find_by(username: params[:username])
    if @user.interests.present?
      @interests = @user.interests.includes(:interest_category).group_by{ |g| g.interest_category.text.tr(" ","_") }
                        .transform_values{ |v| v.map(&:text) }
    end
    if @user.books.present?
      @books = @user.books
    end
    if @user.images.present?
      @images = @user.images
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    success = user.save
    if success
      session[:user_id] = user.id
      user.sign_in
      redirect_to user_path(user.username), flash: { success: t(:sign_up_successful) }
    else
      redirect_to root_url, flash: { danger: user.errors.full_messages }
    end
  end

  def create_image
    user = User.find(params[:user_id])
    user.images.attach(params[:user][:images])
    redirect_to user_path(user.username)
  end

  def delete_image
    user = User.find(params[:user_id])

    image = user.images.find(params[:image_id])
    image.purge

    # redirect to the previous page with a success message
    redirect_to user_path(user.username)#, flash: { success: t(:image_removed) }
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.username)#, flash: { success: t(:user_update_success, user: @user.username) }
    else
      render :edit
    end
  end

  def ajax_update
    @user = User.find(params[:id])
    @user.update(user_params.merge(params.require(:update).permit(:field)))
    render json: { field: params[:field], value: @user.send(params[:field]) }
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
    @remove_from_permit ||= [:id, :created_at, :updated_at]
    @active_storage_params ||= [:profile_image] 
    @selection ||= User.column_names + @active_storage_params - @remove_from_permit
    params.require(:user).permit(@selection.map(&:to_sym))
  end
end
