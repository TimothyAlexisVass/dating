class CreateEthnicity < ActiveRecord::Migration[7.0]
  def change
    create_table :ethnicities do |t|
      t.string :text

      t.timestamps
    end
  end
end
