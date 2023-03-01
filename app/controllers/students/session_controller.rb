class Students::SessionController < Students::BaseController
  before_action :authenticate_student, only: %i[create]

  def new
  end

  def create
    session[:current_student_id] = @student.id

    redirect_to :controller => 'students_base', :action => 'index'
  end

  def student_params
    params.require(:student).permit(:email, :password)
  end

  private

  def authenticate_student
    @student = Student.find_by student_params
    return render :login unless @student
  end
end
