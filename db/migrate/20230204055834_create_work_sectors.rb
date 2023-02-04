class CreateWorkSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :work_sectors do |t|
      t.string :text

      t.timestamps
    end
  end
end
