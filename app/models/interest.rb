class Interest < ApplicationRecord
  has_many :users, through: :interests_user
  belongs_to :interest_category
end
