class Students::BaseController < ApplicationController
  before_action :current_student
  helper_method :current_student

  private

  def current_student
    @current_student ||= Student.find_by id: session[:current_student_id]
  end

  def logged_in?
    !current_student.nil?
  end

  def authenticate_student
    redirect_to :controller => 'students_session', :action => 'index' unless logged_in?
  end
end
