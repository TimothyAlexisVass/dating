class User < ApplicationRecord
  before_save do
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
  has_many :user_work_sectors
  has_many :work_sectors, through: :user_work_sectors
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
    @relationship_status_options ||= [:single, :divorced, :widowed]
  end
  def self.body_type_options
    @body_type_options ||= [:slim, :average, :athletic, :muscular, :curvy, :full_figured, :other]
  end
  def self.eye_color_options
    @eye_color_options ||= [:brown, :blue, :green, :hazel, :gray, :mottled, :amber, :violet, :red, :other]
  end
  def self.education_options
    @education_options ||= [:elementary_school, :middle_school, :high_school, :vocational_school, :some_college, :associate_degree, :bachelor_degree, :masters_degree, :doctoral_degree, :professional_degree]
  end
  def self.income_currency_options
    @income_currency_options ||= [:AUD, :BWP, :CAD, :CHF, :CNY, :EGP, :EUR, :GBP, :GHS, :HKD, :INR, :JPY, :KES, :NGN, :RWF, :SEK, :TZS, :UGX, :USD, :XOF, :ZAR, :ZMW]
  end
  def self.economy_status_options
    @economy_status_options ||= [:debt_relief, :heavy_debt, :some_debt, :no_debt, :just_over_broke, :some_savings, :comfortable_savings, :rich, :very_rich]
  end
  def self.work_status_options
    @work_status_options ||= [:employee, :self_employed, :unemployed, :retired, :student, :financially_independent]
  end
  def self.attendance_frequency_options
    @attendance_frequency_options ||= [:every_sabbath, :almost_every_sabbath, :monthly, :rarely]
  end
  def self.tithing_status_options
    @tithing_status_options ||= [:before_tax, :after_tax, :none]
  end
  def self.alms_status_options
    @alms_status_options ||= [:always_when_asked, :generously, :sometimes, :rarely, :never]
  end
  def self.prayer_frequency_options
    @prayer_frequency_options ||= [:never, :rarely, :occasionally, :regularly, :daily, :multiple_times_daily, :steadfast_in_prayer]
  end
  def self.smoke_status_options
    @smoke_status_options ||= [:always_been_free, :liberated, :trying]
  end
  def self.sober_status_options
    @sober_status_options ||= [:always_been_sober, :liberated, :trying]
  end
  def self.caffeine_status_options
    @caffeine_status_options ||= [:always_been_free, :liberated, :trying]
  end
  def self.drug_status_options
    @drug_status_options ||= [:always_been_free, :liberated, :trying]
  end
  def self.diet_options
    @diet_options ||= [:plant_based, :vegetarian, :pescatarian, :very_rarely_meat, :regularly_meat]
  end
  def self.exercise_options
    @exercise_options ||= [:daily, :almost_daily, :weekly, :rarely]
  end
  def self.wants_children_options
    @wants_children_options ||= [:if_yah_wants, :yes, :maybe, :cannot, :no]
  end



  ##### Basic ####################################################

  validates :username, presence: true, uniqueness: true, length: { minimum: 2, maximum: 255 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email address" }, length: { maximum: 255 }
  validates :password_digest, presence: true, length: { minimum: 6 }
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true, inclusion: { in: gender_options }
  validates :location, presence: true
  validates :verified, inclusion: { in: boolean_options }
  validates :verified_congregation, inclusion: { in: boolean_options }
  validates :verified_rebirth, inclusion: { in: boolean_options }
  validates :is_active, inclusion: { in: boolean_options }



  ##### Profile ####################################################

  validates :bio, length: { maximum: 5000 }
  validates :distance_radius, numericality: { greater_than_or_equal_to: 0 }
  validates :relationship_status, inclusion: { in: relationship_status_options }
  validates :limit_contact_to_age_range, inclusion: { in: boolean_options }



  ##### Appearance ####################################################

  validates :height, presence: true
  validates :body_type, presence: true, inclusion: { in: body_type_options }
  validates :weight, presence: true
  validates :eye_color, presence: true, inclusion: { in: eye_color_options }



  ##### Worldly ####################################################

  validates :education, presence: true, inclusion: { in: education_options }
  validates :income_amount, numericality: { greater_than_or_equal_to: 0 }
  validates :income_currency, presence: true, inclusion: { in: income_currency_options }
  validates :economy_status, presence: true, inclusion: { in: economy_status_options }
  validates :work_status, presence: true, inclusion: { in: work_status_options }



  ##### Spiritually ####################################################

  validates :attendance_frequency, inclusion: { in: attendance_frequency_options }
  validates :tithing_status, inclusion: { in: tithing_status_options }
  validates :alms_status, inclusion: { in: alms_status_options }
  validates :prayer_frequency, inclusion: { in: prayer_frequency_options }
  validates :number_of_times_read_bible, numericality: { greater_than_or_equal_to: 0 }



  ##### Lifestyle ####################################################

  validates :smoke_status, inclusion: { in: smoke_status_options }
  validates :sober_status, inclusion: { in: sober_status_options }
  validates :caffeine_status, inclusion: { in: caffeine_status_options }
  validates :drug_status, inclusion: { in: drug_status_options }
  validates :diet, inclusion: { in: diet_options }
  validates :exercise, inclusion: { in: exercise_options }



  ##### Family ####################################################

  validates :children_status, inclusion: { in: boolean_options }
  validates :wants_children, inclusion: { in: wants_children_options }
  validates :pets_status, inclusion: { in: boolean_options }
  validates :wants_pets, inclusion: { in: boolean_options }
end
