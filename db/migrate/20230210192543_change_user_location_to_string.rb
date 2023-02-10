class ChangeUserLocationToString < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :location, :string
  end
end
