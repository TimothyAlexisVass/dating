class Calling < ApplicationRecord
  has_many :users, through: :user_callings
end
