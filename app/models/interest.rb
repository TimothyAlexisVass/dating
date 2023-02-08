class Interest < ApplicationRecord
  has_many :users, through: :user_interests
  belongs_to :interest_category
end
