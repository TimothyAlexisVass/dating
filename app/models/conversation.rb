class Conversation < ApplicationRecord
  has_many :users_conversations
  has_many :users, through: :users_conversations
  has_many :messages, dependent: :destroy

  before_create :set_id

  private

  def set_id
    self.id = "#{user_ids.min}-#{user_ids.max}"
  end
end
