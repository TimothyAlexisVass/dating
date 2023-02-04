class CreateJoinTableUserImage < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :images do |t|
      # t.index [:user_id, :image_id]
      # t.index [:image_id, :user_id]
    end
  end
end
