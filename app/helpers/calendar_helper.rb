module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end

  def schedule_date schedule
    schedule.object.date.to_date
  end
end
