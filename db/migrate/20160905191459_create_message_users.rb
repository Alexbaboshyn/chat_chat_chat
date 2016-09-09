class CreateMessageUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :message_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :message, index: true
      t.integer :status, default: 0
      t.timestamps null: false
    end
  end
end
