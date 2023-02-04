class CreateJoinTableUserEthnicity < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :ethnicities do |t|
      # t.index [:user_id, :ethnicity_id]
      # t.index [:ethnicity_id, :user_id]
    end
  end
end
