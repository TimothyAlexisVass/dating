class CreateInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :interests do |t|
      t.string :short_text

      t.timestamps
    end
  end
end
