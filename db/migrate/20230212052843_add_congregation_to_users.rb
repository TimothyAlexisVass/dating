class AddCongregationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :congregation, :string
  end
end
