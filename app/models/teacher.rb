class Teacher < ApplicationRecord
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	has_many :chat_messages
	belongs_to :subject
end
