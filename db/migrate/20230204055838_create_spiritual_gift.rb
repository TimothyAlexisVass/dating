class CreateSpiritualGift < ActiveRecord::Migration[7.0]
  def change
    create_table :spiritual_gifts do |t|
      t.string :text

      t.timestamps
    end
  end
end
