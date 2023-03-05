module SubjectHelper
  def subjects
    Subject.all
  end

  def subject_for_select
    subjects.map{ |s| ["#{s.name}", s.id] }
  end
  def set_message_id
    @teacher_id = current_teacher&.id
    @student_id = current_student&.id
  end
end
