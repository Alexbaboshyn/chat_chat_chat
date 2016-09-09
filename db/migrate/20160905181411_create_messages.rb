class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :chat, index: true, foreign_key: true
      t.text :text
      t.timestamps null: false
    end
  end
end
