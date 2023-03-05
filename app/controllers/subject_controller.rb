class SubjectController < ApplicationController
   include SubjectHelper

  def index
  end

  def show
    @subject = Subject.find_by(id: params[:id])
    @messages = ChatMessage.includes(:teacher, :student).where(subject_id: params[:id])
  end
end
