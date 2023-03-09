class Students::SessionController < Students::BaseController
  before_action :authenticate_student, only: %i[create]

  def new
  end
    # hàm này sẽ được gọi đến khi người dùng nhập đúng thông tin và trả về trang root với tư cách người dùng đó 

  def create
    session[:current_student_id] = @student.id

    redirect_to root_url
  end
    #  nếu người dùng click nút đăng xuất thì sẽ vào hàm này và sẽ logout học sinh  
    # và sẽ trả về trang chủ mặc định  
  def destroy
		reset_session
    @current_student = nil

    redirect_to root_url
  end

  private
    # lấy dữ liệu của học sinh nhập vào 
  def student_params
    params.require(:session).permit(:email, :password)
  end
    # hàm xác thực học sinh  
  def authenticate_student
    @student = Student.find_by student_params
    return if @student

    flash[:danger] = 'Thông tin tài khoản không chính xác !' 
    render :new
  end
end
