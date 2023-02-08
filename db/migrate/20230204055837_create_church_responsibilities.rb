class CreateChurchResponsibilities < ActiveRecord::Migration[7.0]
  def change
    create_table :church_responsibilities do |t|
      t.string :text

      t.timestamps
    end
  end
end
