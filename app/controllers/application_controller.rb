class ApplicationController < ActionController::Base
  before_action :current_student, :current_teacher
  helper_method :current_student, :current_teacher

  include SessionsHelper
  helper_method :logged_in?


  def logged_in?
    @current_student || @current_teacher
  end

  def current_student
    @current_student ||= Student.find_by id: session[:current_student_id]
    @teacher_id = ""
    @student_id = current_student.id
  end

  def current_teacher
    @current_teacher ||= Teacher.find_by id: session[:current_teacher_id]
    @teacher_id = current_teacher.id
    @student_id = ""
  end
end
