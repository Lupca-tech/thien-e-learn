module SubjectHelper
  def subjects
    Subject.all
  end

  def subject_for_select
    subjects.map{ |s| ["#{s.name}", s.id] }
  end
end
