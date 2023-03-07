class CreateStudentsCountdowns < ActiveRecord::Migration[6.1]
  def change
    create_table :countdowns do |t|
      t.datetime :time
      t.boolean :status
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
