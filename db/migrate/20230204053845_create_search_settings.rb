class CreateSearchSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :search_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :age_range_min
      t.integer :age_range_max
      t.float :distance_radius

      t.timestamps
    end
  end
end
