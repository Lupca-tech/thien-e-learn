class Students::CalendarController < Students::BaseController
  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def create
    if current_student.update(schedule_params)
      redirect_to "/students/calendar/show", notice: 'Project was successfully updated.'
    else
      render :show
    end
  end

  private
  
  def schedule_params
    params.require(:student).permit(schedules_attributes: [:id, :subject_id, :date, :_destroy])
  end
end
