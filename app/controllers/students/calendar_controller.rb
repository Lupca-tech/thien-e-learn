class Students::CalendarController < Students::BaseController
 # hàm này để show giá trị của params[:date] được truyền vào, biến @date sẽ được gán giá trị ngày tháng tương ứng
  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
  #  dùng để thêm môn học vào lịch học của học sinh 
  def create
    if current_student.update(schedule_params)
      redirect_to "/students/calendar/show", notice: 'Project was successfully updated.'
    else
      render :show
    end
  end

  private
  # lấy môn học  mà người dùng gửi lên 
  def schedule_params
    params.require(:student).permit(schedules_attributes: [:id, :subject_id, :date, :_destroy])
  end
end
