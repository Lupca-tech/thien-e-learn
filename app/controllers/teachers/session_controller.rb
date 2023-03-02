class Teachers::SessionController < ApplicationController
  def new
  end
  def create
    
    teacher = Teacher.find_by(email: params[:session][:email])
    if teacher 
      if  teacher.password == params[:session][:password]
      # Log the user in and redirect to the user's show page.
        flash[:danger] = 'Đăng nhập thành công !' # Not quite right!
        reset_session
        log_in_teacher teacher
        redirect_to root_url
      else
        flash[:danger] = 'Thông tin tài khoản không chính xác !' # Not quite right!
        render 'new'  
      end
    else
      flash[:danger] = 'Thông tin tài khoản không chính xác !' # Not quite right!
      render 'new' 
    end  
  end
  def destroy
   log_out_teacher 
   redirect_to root_url
  end
end
