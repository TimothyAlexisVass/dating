class CreateCongregationResponsibilities < ActiveRecord::Migration[7.0]
  def change
    create_table :congregation_responsibilities do |t|
      t.string :text

      t.timestamps
    end
  end
end
