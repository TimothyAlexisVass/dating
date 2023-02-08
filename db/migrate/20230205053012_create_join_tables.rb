class CreateJoinTables < ActiveRecord::Migration[7.0]
  def change
    create_table :user_interests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :interests, null: false, foreign_key: true
    end
    create_table :user_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :books, null: false, foreign_key: true
    end
    create_table :user_languages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :languages, null: false, foreign_key: true
    end
    create_table :user_work_sectors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :work_sectors, null: false, foreign_key: true
    end
    create_table :user_callings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :callings, null: false, foreign_key: true
    end
    create_table :user_congregation_responsibilities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :congregation_responsibilities, null: false, foreign_key: true
    end
    create_table :user_spiritual_gifts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spiritual_gifts, null: false, foreign_key: true
    end
  end
end
