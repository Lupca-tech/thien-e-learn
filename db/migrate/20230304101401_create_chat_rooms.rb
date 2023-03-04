class CreateChatRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_rooms do |t|
      t.string :name
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
      add_index :chat_rooms, [:teacher_id, :created_at]

  end
end
