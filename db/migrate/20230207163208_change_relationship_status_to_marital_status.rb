class ChangeRelationshipStatusToMaritalStatus < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :relationship_status, :marital_status
  end
end
