module SessionsHelper
# Logs in the given user.
	def log_in_teacher(teacher)
		session[:current_teacher_id] = teacher.id
	end
	# Returns the current logged-in user (if any).
	def current_teacher
		if session[:current_teacher_id]
			@current_teacher ||= Teacher.find_by(id: session[:current_teacher_id])
		end
	end
	
	def logged_in_teacher?
		!current_teacher.nil?
	end

	def log_out_teacher
		reset_session
		@current_teacher = nil
	end
end