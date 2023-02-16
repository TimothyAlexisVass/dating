
class ChurchResponsibility < ApplicationRecord
  has_many :user_church_responsibilities
  has_many :users, through: :user_church_responsibilities
end
