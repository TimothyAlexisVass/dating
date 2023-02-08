class Interest < ApplicationRecord
  has_many :users, through: :users_interests
  belongs_to :interest_category
end
