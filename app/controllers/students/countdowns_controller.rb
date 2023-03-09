class Students::CountdownsController < Students::BaseController
  before_action :set_countdown, only: [:show, :edit, :update, :destroy]

  def index
    @countdowns = Countdown.all
  end

  def show
  end

  def new
    @countdown = Countdown.new
  end

  def edit
  end

  # tạo giờ hẹn cho học sinh 
  def create
    @countdown = current_student.build_countdown(countdown_params)

    if @countdown.save
      redirect_to students_countdown_url(@countdown), notice: 'Tạo thành công.'
    else
      render :new
    end
  end

  #sửa giờ hẹn cho học sinh 
  def update
    if @countdown.update(countdown_params)
      redirect_to students_countdown_url(@countdown), notice: 'Cập nhật thành công.'
    else
      render :edit
    end
  end

  # xóa giờ hẹn của học sinh 
  def destroy
    @countdown.destroy
    redirect_to countdowns_url, notice: 'Countdown was successfully destroyed.'
  end

  private
    # Lấy giờ hẹn của học sinh 
    def set_countdown
      @countdown = Countdown.find(params[:id])
    end

    # lấy dữ liệu người dùng  nhập vào 
    def countdown_params
      hour = params[:countdown]["time(4i)"].to_i
      min = params[:countdown]["time(5i)"].to_i
      
      {
        time: DateTime.now.change({ hour: hour, min: min }),
        status: params[:countdown][:status]
      }
    end
end
