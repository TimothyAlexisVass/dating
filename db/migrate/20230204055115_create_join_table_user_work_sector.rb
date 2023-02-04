class CreateJoinTableUserWorkSector < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :work_sectors do |t|
      # t.index [:user_id, :WorkSector_id]
      # t.index [:WorkSector_id, :user_id]
    end
  end
end
