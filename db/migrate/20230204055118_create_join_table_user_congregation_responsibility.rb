class CreateJoinTableUserCongregationResponsibility < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :congregation_responsibilities do |t|
      # t.index [:user_id, :congregation_responsibility_id]
      # t.index [:congregation_responsibility_id, :user_id]
    end
  end
end
