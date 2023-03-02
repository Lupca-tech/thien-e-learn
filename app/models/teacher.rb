class Teacher < ApplicationRecord
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	
	
end
