class CreateProfession < ActiveRecord::Migration[7.0]
  def change
    create_table :professions do |t|
      t.string :text

      t.timestamps
    end
  end
end
