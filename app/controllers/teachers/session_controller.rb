class Teachers::SessionController < ApplicationController
  before_action :authenticate_teacher, only: %i[create]

  def new
  end

  def create
    flash[:success] = 'Đăng nhập thành công.' 
    log_in_teacher @teacher

    redirect_to root_url
  end

  def destroy
   log_out_teacher 
   redirect_to root_url
  end

  private

  def teacher_params
    params.require(:session).permit(:email, :password)
  end

  def authenticate_teacher
    @teacher = Teacher.find_by teacher_params
    return if @teacher

    flash[:danger] = 'Thông tin tài khoản không chính xác !' 
    render :new
  end
end
