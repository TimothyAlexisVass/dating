class SpiritualGift < ApplicationRecord
  has_many :users, through: :user_spiritual_gifts
end
