class CreateJoinTableUserCalling < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :callings do |t|
      # t.index [:user_id, :calling_id]
      # t.index [:calling_id, :user_id]
    end
  end
end
