module AuthorizationHelper
  def student?
    current_student.present? ? true : false
  end

  def teacher?
    current_teacher.present? ? true : false
  end
end
