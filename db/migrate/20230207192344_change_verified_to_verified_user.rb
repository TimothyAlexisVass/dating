class ChangeVerifiedToVerifiedUser < ActiveRecord::Migration[7.0]
    def change
      rename_column :users, :verified, :verified_user
    end
end
