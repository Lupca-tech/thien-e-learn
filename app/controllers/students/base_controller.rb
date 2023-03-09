class Students::BaseController < ApplicationController
  private
# Hàm current_student được sử dụng để lấy thông tin của học sinh hiện tại đang đăng nhập vào ứng dụng.
  # Đầu tiên, kiểm tra biến @current_student đã được thiết lập hay chưa bằng cách sử dụng toán tử ||=.
  # Nếu biến @current_student đã được thiết lập, hàm sẽ trả về giá trị của biến đó, ngược lại, hàm sẽ tiếp tục thực hiện và tìm kiếm thông tin học sinh trong cơ sở dữ liệu
  # dựa vào id  và sử dụng phương thức find_by .
  def current_student
    @current_student ||= Student.find_by id: session[:current_student_id]
  end
  #Phương thức logged_in?  sử dụng trong các views hoặc các controllers để xác định xem người dùng có đăng nhập hay không
  def logged_in?
    !current_student.nil?
  end

  #để kiểm tra xem người dùng hiện tại có phải là học  hay không. 
  def authenticate_student
    redirect_to :controller => 'students_session', :action => 'index' unless logged_in?
  end
end
