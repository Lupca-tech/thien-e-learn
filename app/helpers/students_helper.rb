module StudentsHelper
	def list_room
		@list_rooms = ChatRoom.all
	end
end
