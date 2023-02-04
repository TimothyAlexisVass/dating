class SpiritualGift < ApplicationRecord
  has_many :user_spiritual_gifts
  has_many :users, through: :user_spiritual_gifts
end
