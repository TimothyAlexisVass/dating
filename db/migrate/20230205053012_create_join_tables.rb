class CreateJoinTables < ActiveRecord::Migration[7.0]
  def change
    create_table :user_interests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :interest, null: false, foreign_key: true
      t.index [:user_id, :interest_id], unique: true
    end
    create_table :user_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.index [:user_id, :book_id], unique: true
    end    
    create_table :user_languages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.index [:user_id, :language_id], unique: true
    end
    create_table :user_work_sectors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :work_sector, null: false, foreign_key: true
      t.index [:user_id, :work_sector_id], unique: true
    end
    create_table :user_callings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :calling, null: false, foreign_key: true
      t.index [:user_id, :calling_id], unique: true
    end
    create_table :user_church_responsibilities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :church_responsibility, null: false, foreign_key: true
    end
    create_table :user_spiritual_gifts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spiritual_gift, null: false, foreign_key: true
      t.index [:user_id, :spiritual_gift_id], unique: true
    end
  end
end
