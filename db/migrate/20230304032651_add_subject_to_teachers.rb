class AddSubjectToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :subject, :string
  end
end
