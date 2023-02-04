class CreateCalling < ActiveRecord::Migration[7.0]
  def change
    create_table :callings do |t|
      t.string :text

      t.timestamps
    end
  end
end
