class CreateChatsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chats_users, id: false do |t|
      t.integer :user_id
      t.integer :chat_id
    end
  end
end
