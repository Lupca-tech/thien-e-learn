module SubjectHelper
  def subjects
   if current_teacher.present?
      Subject.where(teacher_id: current_teacher.id)
    else
      Subject.all
    end  
  end

  def subject_for_select
    subjects.map{ |s| ["#{s.name}", s.id] }
  end
end
