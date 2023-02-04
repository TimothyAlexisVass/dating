class Like < ApplicationRecord
  belongs_to :like_other, class_name: "User"
  belongs_to :liked_by_other, class_name: "User"
end
