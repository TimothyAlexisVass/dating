class CreateJoinTableUserSpiritualGift < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :spiritual_gifts do |t|
      # t.index [:user_id, :spiritual_gift_id]
      # t.index [:spiritual_gift_id, :user_id]
    end
  end
end
