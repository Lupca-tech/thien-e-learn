class Students::SessionController < Students::BaseController
  before_action :authenticate_student, only: %i[create]

  def new
  end

  def create
    session[:current_student_id] = @student.id

    redirect_to root_url
  end

  def destroy
		reset_session
    @current_student = nil

    redirect_to root_url
  end

  private

  def student_params
    params.require(:session).permit(:email, :password)
  end

  def authenticate_student
    @student = Student.find_by student_params
    return if @student

    flash[:danger] = 'Thông tin tài khoản không chính xác !' 
    render :new
  end
end
