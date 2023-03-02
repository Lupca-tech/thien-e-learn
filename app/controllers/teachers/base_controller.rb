class Teachers::BaseController < ApplicationController
  before_action :current_teacher
  helper_method :current_teacher

  private

  def current_teacher
    @current_student ||= Student.find_by id: session[:current_student_id]
  end

  def logged_in?
    !current_teacher.nil?
  end

  def authenticate_student
    redirect_to :controller => 'teachers_session', :action => 'new' unless logged_in?
  end
end
