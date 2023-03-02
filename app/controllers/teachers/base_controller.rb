class Teachers::BaseController < ApplicationController
  before_action :current_teacher
  helper_method :current_teacher

  private

  def current_teacher
    @current_teacher ||= Teacher.find_by id: session[:current_teacher_id]
  end

  def logged_in?
    !current_teacher.nil?
  end

  
end
