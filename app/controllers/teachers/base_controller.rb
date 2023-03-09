class Teachers::BaseController < ApplicationController
  private
  # Hàm current_student được sử dụng để lấy thông tin của giáo viên  hiện tại đang đăng nhập vào ứng dụng.
  # Đầu tiên, kiểm tra biến @current_student đã được thiết lập hay chưa bằng cách sử dụng toán tử ||=.
  # Nếu biến @current_student đã được thiết lập, hàm sẽ trả về giá trị của biến đó, ngược lại, hàm sẽ tiếp tục thực hiện và tìm kiếm thông tin học sinh trong cơ sở dữ liệu
  # dựa vào id  và sử dụng phương thức find_by .
  def current_teacher
    @current_teacher ||= Teacher.find_by id: session[:current_teacher_id]
  end
#Phương thức logged_in?  sử dụng trong các views hoặc các controllers để xác định xem người dùng có đăng nhập hay không
  def logged_in?
    !current_teacher.nil?
  end
end
