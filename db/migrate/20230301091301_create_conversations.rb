class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations, id: :string do |t|
      t.timestamps
    end

    create_table :users_conversations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :conversation_id, null: false
      t.index [:user_id, :conversation_id], unique: true
    end
    
  end
end
