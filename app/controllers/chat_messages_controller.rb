class ChatMessagesController < ApplicationController
  before_action :set_chat_message, only: [:show, :edit, :update, :destroy]
  def index
    @chat_messages = ChatMessage.all
    #  Hàm này lấy tất cả dữ liêu có trong bảng CHatmessage 
  end


  def new
    @chat_message = ChatMessage.new

  end
  def create 
    @chat_message = ChatMessage.new(chat_message_params)  #hàm sẽ tạo 1 đối tượng mới @chat_message và sẽ lấy dữ liệu từ hàm chat_message_params bên dưới 
    if @chat_message.save # hàm này dùng để lưu đối tượng @chat_message vào bảng 
      broadcast_chat # Hiện chuông báo có tin nhắn mới
      redirect_to controller: 'subject', action: 'show', id: chat_message_params[:subject_id]   # Nếu hàm lưu bên trên được thực hiện thì nó sẽ chuyển người dùng đến controller  subject
      # và đi vào hàm show truyền theo  id = chat_message_params[:subject_id]   chính là trường subject_id dưới  hàm chat_message_params
    else
      render :new # nếu không lưu được message thì hàm này sẽ chuyển người dùng đến trang viết message mới 
    end
  end

  private
    def set_chat_message
      @chat_message = ChatMessage.find(params[:id])
    end
    
    def chat_message_params
      #  hàm này dẽ lấy dự liệu mà người dùng truyền bao gồm content , student_id và subject_id,teacher_id  vào phục vụ cho hàm create bên trên 
      params.require(:chat_message).permit(:content, :teacher_id, :student_id, :subject_id)
    end

    def broadcast_chat
      partial = "subject/show"
      subject_id = chat_message_params[:subject_id]
      subject = Subject.find(subject_id)
      messages = ChatMessage.includes(:teacher, :student).where(subject_id: params[:subject_id])


      ActionCable.server.broadcast(

        "chat_#{subject_id}",
        {
          subject_id: params[:subject_id],
          current_user_id: current_student&.id || current_teacher&.id
        }
      )
    end
end
