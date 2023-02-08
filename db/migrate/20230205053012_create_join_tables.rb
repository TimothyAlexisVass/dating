class CreateJoinTables < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :interests, table_name: :users_interests
    create_join_table :users, :books, table_name: :users_books
    create_join_table :users, :languages, table_name: :users_languages
    create_join_table :users, :work_sectors, table_name: :users_work_sectors
    create_join_table :users, :callings, table_name: :users_callings
    create_join_table :users, :congregation_responsibilities, table_name: :users_congregation_responsibilities
    create_join_table :users, :spiritual_gifts, table_name: :users_spiritual_gifts
  end
end
