class WorkSector < ApplicationRecord
  has_many :user_work_sectors
  has_many :users, through: :user_work_sectors
end
