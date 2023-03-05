class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages do |t|
      t.string :content
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
    add_index :chat_messages, [:teacher_id, :created_at]
    add_index :chat_messages, [:student_id, :created_at]
    add_index :chat_messages, [:subject_id, :created_at]

  end
end
