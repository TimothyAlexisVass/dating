class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :like_other_id
      t.integer :liked_by_other_id

      t.timestamps
    end
  end
end
