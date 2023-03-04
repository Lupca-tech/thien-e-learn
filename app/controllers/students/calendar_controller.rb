class Students::CalendarController < Students::BaseController
  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
