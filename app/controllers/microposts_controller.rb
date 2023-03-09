class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]  # Hàm này để gọi đến hàm set_micropost để dùng chung cho các hàm show,edit,update,destroy

  # GET /microposts
  def index
    @microposts = Micropost.all
     # truy vấn và lấy ra tất cả bản ghi có trong bảng Micropost 
  end

  # GET /microposts/1
  def show
  end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
    #  Tạo 1 đối tượng mới 
  end

  # GET /microposts/1/edit
  def edit
  end

  # POST /microposts
  def create
    @micropost = Micropost.new(micropost_params)  #  hàm này sẽ  sẽ tạo 1 đối tượng mới của micropost và lất dữ liệu request từ hàm micropost_params

    if @micropost.save 
      #  hàm này dùng để lưu đối tượng @Micropost  
      redirect_to @micropost, notice: 'Micropost was successfully created.' #nếu @Micropost được lưu lại CSDL thì  nó sẽ chuyển view người dùng về trang @Micropost với thông báo Micropost was successfully created  
    else
      render :new  # đoạn code này ngược lại với đoạn code trên nếu nó không được lư  thì nó sẽ chuyển tiếp người dùng đến trang tạo mới bài đăng 
    end
  endđ

  # PATCH/PUT /microposts/1
  def update
    if @micropost.update(micropost_params)
      redirect_to @micropost, notice: 'Micropost was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /microposts/1
  def destroy
    @micropost.destroy
    redirect_to microposts_url, notice: 'Micropost was successfully destroyed.'
    # xóa đối tượng micropost dựa theo id  của bài viết 
    # và sẽ chuyển người dùng đến view danh danh sách bài viết với thông báo 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
      # lấy id của bài viết khi người dùng click 
    end
    def micropost_params
      #  Hàm này sẽ lấy dữ liệu bài viết từ người dùng 
      params.require(:micropost).permit(:content, :teacher_id)
    end
end
