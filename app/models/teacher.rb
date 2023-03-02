class Teacher < ApplicationRecord
	attr_accessor :remember_token
	has_secure_password
	before_save { self.email = email.downcase }
	validates :email, presence: true, length: { maximum: 255 },
	uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password

# Returns the hash digest of the given string.
	def Teacher.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	# Returns a random token.
	def Teacher.new_token
		SecureRandom.urlsafe_base64
	end
	def remember
		self.remember_token = Teacher.new_token
		update_attribute(:remember_digest, Teacher.digest(remember_token))
	end
	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end
	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end
end
