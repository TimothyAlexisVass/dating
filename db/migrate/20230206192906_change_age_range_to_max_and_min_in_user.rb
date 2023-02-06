class ChangeAgeRangeToMaxAndMinInUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :age_range_lower, :integer, default: 18
    add_column :users, :age_range_upper, :integer, default: 99
    remove_column :users, :age_range, :integer
  end
end
