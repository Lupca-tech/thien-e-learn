class Teachers::SessionController < ApplicationController
  before_action :authenticate_teacher, only: %i[create] # gọi đến hàm authenticate_teacher để sử dụng cho hành động create 

  def new
  end
  # hàm này sẽ được gọi đến khi người dùng nhập đúng thông tin và trả về trang root với tư cách người dùng đó 
  def create
    flash[:success] = 'Đăng nhập thành công.' 
    log_in_teacher @teacher
    redirect_to root_url
  end
    #  nếu người dùng click nút đăng xuất thì sẽ vào hàm này và sẽ logout teacher 
    # và sẽ trả về trang chủ mặc định 
  def destroy
   log_out_teacher 
   redirect_to root_url
  end

  private

  def teacher_params
    #  lấy thông tin email và password của người dùng gửi lên 
    params.require(:session).permit(:email, :password)
  end
  # authenticate_teacher xác minh giáo viết 
  def authenticate_teacher
    @teacher = Teacher.find_by teacher_params
    return if @teacher
    flash[:danger] = 'Thông tin tài khoản không chính xác !' 
    render :new
  end
end
