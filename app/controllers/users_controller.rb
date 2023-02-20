class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    now = Time.now.to_date

    birth_date_lower = now.years_ago(@current_user.age_range_upper)
    birth_date_upper = now.years_ago(@current_user.age_range_lower)
    @users = User.all.where(gender: @current_user.searching_for).where(
      'birth_date >= ? and birth_date <= ?', birth_date_lower, birth_date_upper
    )

    if params[:only_show].present?
      relevant_params = ["only_show", "diet", "body_type", "exercise", "marital_status", "pets_status", "wants_pets", "children_status", "wants_children"]

      filter_params = params.select{ |k,_| relevant_params.include?(k) }
      filter_params.transform_values! do |value|
        if value.is_a?(Array)
          value.select(&:present?).map{ |e| e=="not_specified" ? nil : e }
        else
          value.blank? ? nil : value
        end
      end
      only_show = filter_params[:only_show]
      diet = filter_params[:diet]
      body_type = filter_params[:body_type]
      exercise = filter_params[:exercise]
      marital_status = filter_params[:marital_status]
      pets_status = filter_params[:pets_status]
      wants_pets = filter_params[:wants_pets]
      children_status = filter_params[:children_status]
      wants_children = filter_params[:wants_children]

      only_show.each do |option|
        case option
          when "only_verified"
            @users = @users.where(verified_user: true)
          when "only_reborn"
            @users = @users.where.not(rebirth_date: nil)
          when "only_smokefree"
            @users = @users.where(smoke_status: ['always_been_free', 'liberated'])
          when "only_drugfree"
            @users = @users.where(caffeine_status: ['always_been_free', 'liberated'], drug_status: ['always_been_free', 'liberated'])
          when "only_sober"
            @users = @users.where(sober_status: ['always_been_sober', 'liberated'])
        end
      end

      @users = @users.where(diet: diet) if diet.present?
      @users = @users.where(body_type: body_type) if body_type.present?
      @users = @users.where(exercise: exercise) if exercise.present?
      @users = @users.where(marital_status: marital_status) if marital_status.present?
      @users = @users.where(pets_status: pets_status=="true" ? true : false) if pets_status.present?
      @users = @users.where(wants_pets: wants_pets=="true" ? true : false) if wants_pets.present?
      @users = @users.where(children_status: children_status=="true" ? true : false) if children_status.present?
      @users = @users.where(wants_children: wants_children.map { |e| e == "not_specified" ? nil : e }) if wants_children.present?
    end

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
    if @user.spiritual_gifts.present?
      @spiritual_gifts = @user.spiritual_gifts
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
