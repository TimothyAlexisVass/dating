class CreateInterestCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :interest_categories do |t|
      t.string :text

      t.timestamps
    end
  end
end
