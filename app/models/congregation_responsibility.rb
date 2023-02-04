
class CongregationResponsibility < ApplicationRecord
  has_many :user_congregation_responsibilities
  has_many :users, through: :user_congregation_responsibilities
end
