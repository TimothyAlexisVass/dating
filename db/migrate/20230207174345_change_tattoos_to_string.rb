class ChangeTattoosToString < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :tattoos, :string
  end
end
