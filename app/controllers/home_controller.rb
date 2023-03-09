class HomeController < ApplicationController
  def index
    @microposts = Micropost.all.group_by(&:teacher_id)
    # @microposts lấy dữ tất cả dử liệu của bảng teacher sau đó chia nhóm chúng dựa trên giá trị của trường "teacher_id"
  end
end
