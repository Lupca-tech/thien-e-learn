class ApplicationController < ActionController::Base
    # Phương thức này được sử dụng để thiết lập biến đối tượng cho đối tượng Sinh viên (Student) và Giáo viên (Teacher)
  # hiện tại trước khi thực hiện các hành động trong controller của ứng dụng
  before_action :current_student, :current_teacher

 #các phương thức hỗ trợ được định nghĩa là current_student và current_teacher. 
   #Điều này cho phép các phương thức này có thể được sử dụng trong views của ứng dụng để truy cập thông tin về sinh viên và giáo viên hiện tại.
  helper_method :current_student, :current_teacher
  
  include SessionsHelper
  helper_method :logged_in?
  # hàm logged_in? kiểm tra xem có giáo viên hay học sinh nào đã đăng nhập hay chưa. 
  #Nếu biến @current_student hoặc biến @current_teacher có giá trị, nghĩa là người dùng tương ứng (học sinh hoặc giáo viên) đã đăng nhập, hàm sẽ trả về giá trị true
  def logged_in?
    @current_student || @current_teacher
  end
  # Hàm current_student được sử dụng để lấy thông tin của học sinh hiện tại đang đăng nhập vào ứng dụng.
  # Đầu tiên, kiểm tra biến @current_student đã được thiết lập hay chưa bằng cách sử dụng toán tử ||=.
  # Nếu biến @current_student đã được thiết lập, hàm sẽ trả về giá trị của biến đó, ngược lại, hàm sẽ tiếp tục thực hiện và tìm kiếm thông tin học sinh trong cơ sở dữ liệu
  # dựa vào id  và sử dụng phương thức find_by .
  def current_student
    @current_student ||= Student.find_by id: session[:current_student_id]
  end
  # Hàm current_teacher được sử dụng để lấy thông tin của giáo viên hiện tại đang đăng nhập vào ứng dụng.
  # Đầu tiên, kiểm tra biến @current_student đã được thiết lập hay chưa bằng cách sử dụng toán tử ||=.
  # Nếu biến @current_teacher đã được thiết lập, hàm sẽ trả về giá trị của biến đó, ngược lại, hàm sẽ tiếp tục thực hiện và tìm kiếm thông tin giáo viên  trong cơ sở dữ liệu
  # dựa vào id  và sử dụng phương thức find_by .
  def current_teacher
    @current_teacher ||= Teacher.find_by id: session[:current_teacher_id]
  end
  
end
