class UserChurchResponsibility < ApplicationRecord
  belongs_to :user
  belongs_to :church_responsibility
end
