
class ChurchResponsibility < ApplicationRecord
  has_many :users, through: :user_church_responsibilities
end
