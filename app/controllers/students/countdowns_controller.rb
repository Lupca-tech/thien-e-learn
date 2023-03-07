class Students::CountdownsController < Students::BaseController
  before_action :set_countdown, only: [:show, :edit, :update, :destroy]

  # GET /students/countdowns
  def index
    @countdowns = Countdown.all
  end

  # GET /students/countdowns/1
  def show
  end

  # GET /students/countdowns/new
  def new
    @countdown = Countdown.new
  end

  # GET /students/countdowns/1/edit
  def edit
  end

  # POST /students/countdowns
  def create
    @countdown = current_student.build_countdown(countdown_params)

    if @countdown.save
      redirect_to students_countdown_url(@countdown), notice: 'Tạo thành công.'
    else
      render :new
    end
  end

  # PATCH/PUT /students/countdowns/1
  def update
    if @countdown.update(countdown_params)
      redirect_to students_countdown_url(@countdown), notice: 'Cập nhật thành công.'
    else
      render :edit
    end
  end

  # DELETE /students/countdowns/1
  def destroy
    @countdown.destroy
    redirect_to countdowns_url, notice: 'Countdown was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_countdown
      @countdown = Countdown.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def countdown_params
      hour = params[:countdown]["time(4i)"].to_i
      min = params[:countdown]["time(5i)"].to_i
      
      {
        time: DateTime.now.change({ hour: hour, min: min }),
        status: params[:countdown][:status]
      }
    end
end
