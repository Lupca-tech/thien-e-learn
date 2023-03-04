module ChatRoomsHelper
	def set_message_id

      if current_teacher.present?
        @sender_id = current_teacher.id
        @room_teacher = ChatRoom.find_by(teacher_id: current_teacher.id)
      end
      if current_student.present?
        @sender_id = current_student.ids
        @room_teacher = ChatRoom.find_by id: params[:id]
      end
    end
    def set_room
    	if current_teacher.present?
    		@room = ChatRoom.find_by teacher_id: current_teacher.id
    		@messages = ChatMessage.includes(:teacher, :student).where(chat_room_id: @room.id)
        you_use = current_teacher

    	end
    	if current_student.present?
    		@room = ChatRoom.find_by id: params[:id]
        @messages = ChatMessage.includes(:teacher, :student).where(chat_room_id: @room.id)
    		you_use = current_student
      end	
    end
end
