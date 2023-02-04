class Calling < ApplicationRecord
  has_many :user_callings
  has_many :users, through: :user_callings
end
