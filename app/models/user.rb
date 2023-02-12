class User < ApplicationRecord
  before_save :downcase_email_and_username

  def downcase_email_and_username
    email.downcase!
    username.downcase!
  end

  ##### Associations ####################################################

  has_many :like_others, class_name: "Like", foreign_key: "like_other_id", dependent: :destroy
  has_many :liked_by_others, class_name: "Like", foreign_key: "liked_by_other_id", dependent: :destroy
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_one_attached :profile_image
  has_many_attached :images
  has_many :user_search_settings
  has_many :search_settings, through: :user_search_settings
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :user_books
  has_many :books, through: :user_books
  has_many :user_ethnicities
  has_many :ethnicities, through: :user_ethnicities
  has_many :user_professions
  has_many :professions, through: :user_professions
  has_many :user_callings
  has_many :callings, through: :user_callings
  has_many :user_church_responsibilities
  has_many :church_responsibilities, through: :user_church_responsibilities
  has_many :user_spiritual_gifts
  has_many :spiritual_gifts, through: :user_spiritual_gifts



  def self.boolean_options
    @boolean_options ||= [true, false]
  end
  def self.gender_options
    @gender_options ||= %w[male female]
  end
  def self.marital_status_options
    @marital_status_options ||= %w[single divorced widowed]
  end
  def self.body_type_options
    @body_type_options ||= %w[slim average athletic muscular curvy full_figured other]
  end
  def self.eye_color_options
    @eye_color_options ||= %w[brown blue green hazel gray mixed amber violet red other]
  end
  def self.education_options
    @education_options ||= %w[elementary_school middle_school high_school vocational_school some_college associate_degree bachelor_degree masters_degree doctoral_degree professional_degree]
  end
  def self.income_currency_options
    @income_currency_options ||= %w[AUD BWP CAD CHF CNY EGP EUR GBP GHS HKD INR JPY KES NGN RWF SEK TZS UGX USD XOF ZAR ZMW]
  end
  def self.economy_status_options
    @economy_status_options ||= %w[debt_relief heavy_debt some_debt no_debt just_over_broke some_savings comfortable_savings rich very_rich]
  end
  def self.work_status_options
    @work_status_options ||= %w[employee self_employed unemployed retired student financially_independent]
  end
  def self.attendance_frequency_options
    @attendance_frequency_options ||= %w[every_sabbath almost_every_sabbath monthly rarely]
  end
  def self.tithing_status_options
    @tithing_status_options ||= %w[before_tax after_tax none]
  end
  def self.alms_status_options
    @alms_status_options ||= %w[always_when_asked generously sometimes rarely never]
  end
  def self.prayer_frequency_options
    @prayer_frequency_options ||= %w[never rarely occasionally regularly daily multiple_times_daily steadfast_in_prayer]
  end
  def self.tattoos_options
    @tattoos_options ||= %w[covered huge big medium small tiny none]
  end
  def self.smoke_status_options
    @smoke_status_options ||= %w[always_been_free liberated trying]
  end
  def self.sober_status_options
    @sober_status_options ||= %w[always_been_sober liberated trying]
  end
  def self.caffeine_status_options
    @caffeine_status_options ||= %w[always_been_free liberated trying]
  end
  def self.drug_status_options
    @drug_status_options ||= %w[always_been_free liberated trying]
  end
  def self.diet_options
    @diet_options ||= %w[plant_based vegan vegetarian pescatarian very_rarely_meat regularly_meat]
  end
  def self.exercise_options
    @exercise_options ||= %w[daily almost_daily weekly rarely]
  end
  def self.wants_children_options
    @wants_children_options ||= %w[if_yah_wills yes maybe cannot no]
  end
  def height_options
    @height_options ||= (120..220).to_a.map{ |height| ["#{height} cm (#{cm_to_ft_in(height)})", height.to_s] }
  end
  def weight_options
    @weight_options ||= (40..150).to_a.map{ |weight| ["#{weight} kg (#{(weight * 2.20462).floor} lbs)", weight.to_s] }
  end
  def age_options(low=18, high=99)
    (low..high).to_a.map(&:to_s)
  end
  

  ##### Basic ####################################################

  validates :username, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email address" }, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true, inclusion: { in: gender_options, allow_nil: true, allow_blank: true }
  validates :verified_user, inclusion: { in: boolean_options, allow_nil: true, allow_blank: true }
  validates :verified_congregation, inclusion: { in: boolean_options, allow_nil: true, allow_blank: true }
  validates :verified_rebirth, inclusion: { in: boolean_options, allow_nil: true, allow_blank: true }
  validates :is_active, inclusion: { in: boolean_options, allow_nil: true, allow_blank: true }
  validate :images_are_images



  ##### Profile ####################################################

  validates :bio, length: { maximum: 5000 }
  validates :distance_radius, numericality: { greater_than_or_equal_to: 0 }
  validates :marital_status, inclusion: { in: marital_status_options, allow_nil: true, allow_blank: true }
  validates :age_range_lower, numericality: { greater_than_or_equal_to: 18, allow_nil: true, allow_blank: true }
  validates :age_range_upper, numericality: { less_than_or_equal_to: 99, allow_nil: true, allow_blank: true }
  validates :limit_contact_to_age_range, inclusion: { in: boolean_options, allow_nil: true, allow_blank: true }



  ##### Appearance ####################################################

  validates :body_type, inclusion: { in: body_type_options, allow_nil: true, allow_blank: true }
  validates :eye_color, inclusion: { in: eye_color_options, allow_nil: true, allow_blank: true }



  ##### Worldly ####################################################

  validates :education, inclusion: { in: education_options, allow_nil: true, allow_blank: true }
  validates :income_amount, numericality: { greater_than_or_equal_to: 0, allow_nil: true  }
  validates :income_currency, inclusion: { in: income_currency_options, allow_nil: true, allow_blank: true }
  validates :economy_status, inclusion: { in: economy_status_options, allow_nil: true, allow_blank: true }
  validates :work_status, inclusion: { in: work_status_options, allow_nil: true, allow_blank: true }



  ##### Spiritually ####################################################

  validates :attendance_frequency, inclusion: { in: attendance_frequency_options, allow_nil: true, allow_blank: true }
  validates :tithing_status, inclusion: { in: tithing_status_options, allow_nil: true, allow_blank: true }
  validates :alms_status, inclusion: { in: alms_status_options, allow_nil: true, allow_blank: true }
  validates :prayer_frequency, inclusion: { in: prayer_frequency_options, allow_nil: true, allow_blank: true }
  validates :number_of_times_read_bible, numericality: { greater_than_or_equal_to: 0, allow_nil: true, allow_blank: true }



  ##### Lifestyle ####################################################

  validates :smoke_status, inclusion: { in: smoke_status_options, allow_nil: true, allow_blank: true }
  validates :sober_status, inclusion: { in: sober_status_options, allow_nil: true, allow_blank: true }
  validates :caffeine_status, inclusion: { in: caffeine_status_options, allow_nil: true, allow_blank: true }
  validates :drug_status, inclusion: { in: drug_status_options, allow_nil: true, allow_blank: true }
  validates :diet, inclusion: { in: diet_options, allow_nil: true, allow_blank: true }
  validates :exercise, inclusion: { in: exercise_options, allow_nil: true, allow_blank: true }



  ##### Family ####################################################

  validates :children_status, inclusion: { in: boolean_options, allow_nil: true, allow_blank: true }
  validates :wants_children, inclusion: { in: wants_children_options, allow_nil: true, allow_blank: true }
  validates :pets_status, inclusion: { in: boolean_options, allow_nil: true, allow_blank: true }
  validates :wants_pets, inclusion: { in: boolean_options, allow_nil: true, allow_blank: true }

  def age
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end

  def searching_for
    gender == "male" ? :female : :male
  end

  def specified(field)
    return :not_specified if self[field].blank?
    self[field].to_s
  end

  def body_height_string
    return I18n.t(:not_specified) if height.blank?
    "#{height} cm (#{cm_to_ft_in(height)})"
  end

  def body_weight_string
    return I18n.t(:not_specified) if weight.blank?
    lb = (weight * 2.20462).floor
    "#{weight} kg (#{lb} lbs)"
  end

  def baptism_string
    return I18n.t(:not_yet_baptized) if rebirth_date.blank?
    rebirth_date
  end

  def marital_status_string
    return I18n.t(:not_specified) if marital_status.blank?
    I18n.t("#{marital_status}.#{gender}")
  end

  def cm_to_ft_in(cm)
    total_inches = cm.to_i / 2.54
    feet = total_inches / 12
    inches = total_inches % 12
    "#{feet.floor}'#{inches.round}\""
  end

  def verified?(field)
    self[field] ? "✅ #{I18n.t(:verified)}" : "⛔ #{I18n.t(:not_verified)}"
  end

  def sign_in
    update(is_active: true)
  end

  def sign_out
    update(is_active: false)
  end

  private

    def images_are_images
      images.each do |image|
        next if image.content_type.start_with? 'image/'
        image.purge
        errors.add(:images, 'only images allowed')
      end
    end
end
