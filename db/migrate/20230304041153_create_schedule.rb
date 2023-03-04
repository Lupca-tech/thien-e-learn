class CreateSchedule < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.bigint :student_id
      t.datetime :date
      t.bigint :subject_id

      t.timestamps
    end
  end
end
