class CreateSearchSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :search_settings do |t|
      t.integer :user_id
      t.integer :age_range_min
      t.integer :age_range_max
      t.float :distance_radius

      t.timestamps
    end
    add_index :search_settings, :user_id
  end
end
