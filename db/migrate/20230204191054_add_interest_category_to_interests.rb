class AddInterestCategoryToInterests < ActiveRecord::Migration[7.0]
  def change
    add_reference :interests, :interest_category, null: false, foreign_key: true
  end
end
