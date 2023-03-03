class Teachers::BaseController < ApplicationController
  private

  def current_teacher
    @current_teacher ||= Teacher.find_by id: session[:current_teacher_id]
  end

  def logged_in?
    !current_teacher.nil?
  end
end
