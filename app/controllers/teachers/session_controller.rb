class Teachers::SessionController < ApplicationController
  def new
  end
  def create
    teacher = Teacher.find_by(email: params[:session][:email].downcase)
    if teacher&.authenticate(params[:session][:password])
    # Log the user in and redirect to the user's show page.
      flash[:danger] = 'Đăng nhập thành công !' # Not quite right!
      reset_session
      log_in_teacher teacher
      redirect_to teacher
    else
      flash[:danger] = 'Thông tin tài khoản không chính xác !' # Not quite right!
      render 'new'
    end
  end
  def destroy
   log_out
   redirect_to root_url
  end
end
