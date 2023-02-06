class User < ApplicationRecord
  before_save :downcase_email

  def downcase_email
    email.downcase!
  end
  
  ##### Associations ####################################################

  has_many :like_others, class_name: "Like", foreign_key: "like_other_id", dependent: :destroy
  has_many :liked_by_others, class_name: "Like", foreign_key: "liked_by_other_id", dependent: :destroy
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :user_images
  has_many :images, through: :user_images
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
  has_many :user_congregation_responsibilities
  has_many :congregation_responsibilities, through: :user_congregation_responsibilities
  has_many :user_spiritual_gifts
  has_many :spiritual_gifts, through: :user_spiritual_gifts
  has_one :congregation



  def self.boolean_options
    @boolean_options ||= [true, false]
  end
  def self.gender_options
    @gender_options ||= [:male, :female]
  end
  def self.relationship_status_options
    @relationship_status_options ||= %w[single divorced widowed]
  end
  def self.body_type_options
    @body_type_options ||= %w[slim average athletic muscular curvy full_figured other]
  end
  def self.eye_color_options
    @eye_color_options ||= %w[brown blue green hazel gray mottled amber violet red other]
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
    @diet_options ||= %w[plant_based vegetarian pescatarian very_rarely_meat regularly_meat]
  end
  def self.exercise_options
    @exercise_options ||= %w[daily almost_daily weekly rarely]
  end
  def self.wants_children_options
    @wants_children_options ||= %w[if_yah_wants yes maybe cannot no]
  end



  ##### Basic ####################################################

  validates :username, presence: true, uniqueness: true, length: { minimum: 2, maximum: 255 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email address" }, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :rebirth_date, presence: true
  validates :gender, presence: true, :inclusion => 0..1
  validates :verified, inclusion: { in: boolean_options, allow_nil: true }
  validates :verified_congregation, inclusion: { in: boolean_options, allow_nil: true }
  validates :verified_rebirth, inclusion: { in: boolean_options, allow_nil: true }
  validates :is_active, inclusion: { in: boolean_options, allow_nil: true }



  ##### Profile ####################################################

  validates :bio, length: { maximum: 5000 }
  validates :distance_radius, numericality: { greater_than_or_equal_to: 0 }
  validates :relationship_status, inclusion: { in: relationship_status_options, allow_nil: true }
  validates :age_range_lower, numericality: { greater_than_or_equal_to: 18, allow_nil: true }
  validates :age_range_upper, numericality: { less_than_or_equal_to: 99, allow_nil: true }
  validates :limit_contact_to_age_range, inclusion: { in: boolean_options, allow_nil: true }



  ##### Appearance ####################################################

  validates :body_type, inclusion: { in: body_type_options, allow_nil: true }
  validates :eye_color, inclusion: { in: eye_color_options, allow_nil: true }



  ##### Worldly ####################################################

  validates :education, inclusion: { in: education_options, allow_nil: true }
  validates :income_amount, numericality: { greater_than_or_equal_to: 0, allow_nil: true  }
  validates :income_currency, inclusion: { in: income_currency_options, allow_nil: true }
  validates :economy_status, inclusion: { in: economy_status_options, allow_nil: true }
  validates :work_status, inclusion: { in: work_status_options, allow_nil: true }



  ##### Spiritually ####################################################

  validates :attendance_frequency, inclusion: { in: attendance_frequency_options, allow_nil: true }
  validates :tithing_status, inclusion: { in: tithing_status_options, allow_nil: true }
  validates :alms_status, inclusion: { in: alms_status_options, allow_nil: true }
  validates :prayer_frequency, inclusion: { in: prayer_frequency_options, allow_nil: true }
  validates :number_of_times_read_bible, numericality: { greater_than_or_equal_to: 0, allow_nil: true }



  ##### Lifestyle ####################################################

  validates :smoke_status, inclusion: { in: smoke_status_options, allow_nil: true }
  validates :sober_status, inclusion: { in: sober_status_options, allow_nil: true }
  validates :caffeine_status, inclusion: { in: caffeine_status_options, allow_nil: true }
  validates :drug_status, inclusion: { in: drug_status_options, allow_nil: true }
  validates :diet, inclusion: { in: diet_options, allow_nil: true }
  validates :exercise, inclusion: { in: exercise_options, allow_nil: true }



  ##### Family ####################################################

  validates :children_status, inclusion: { in: boolean_options, allow_nil: true }
  validates :wants_children, inclusion: { in: wants_children_options, allow_nil: true }
  validates :pets_status, inclusion: { in: boolean_options, allow_nil: true }
  validates :wants_pets, inclusion: { in: boolean_options, allow_nil: true }

  def gender_text
    User.gender_options[gender]
  end

  def age
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end
end
