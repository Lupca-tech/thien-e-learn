class SubjectController < ApplicationController
   include SubjectHelper

  def index
  end

  def show
    @subject = Subject.find_by(id: params[:id])    
    #  Hàm này sẽ lấy dữ liệu và tìm kiếm trong bảng Subject  dự theo id mà nparram truyền vào 
    @messages = ChatMessage.includes(:teacher, :student).where(subject_id: params[:id])
    #  truy vấn tất cả các ChatMessage từ cơ sở dữ liệu . includes để kèm theo thông tin của đối tượng Teacher và Student 
    # Sau đó, đoạn mã áp dụng một điều kiện để lọc ra những ChatMessage có thuộc tính "subject_id" bằng với giá trị của tham số "id" truyền vào từ request
    # Kết quả trả về sẽ là một danh sách các ChatMessage đáp ứng điều kiện lọc được áp dụng, mỗi ChatMessage sẽ có thông tin về Teacher và Student của nó.
  end
end
