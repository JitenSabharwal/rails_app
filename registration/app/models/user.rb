class User < ActiveRecord::Base
	has_many :article
	has_many :result
	attr_accessor :password
	validates :username,:email , presence: true
	validates :email , uniqueness: true
	before_save :encrypt
	after_save :clear_password
	
	def encrypt
		if password.present?
			self.salt =BCrypt::Engine.generate_salt
			self.encrypted_password =BCrypt::Engine.hash_secret(password,salt)
		end	
	end
	def clear_password
		self.password = nil
	end  

	def self.authenticate(username_or_email="" ,login_password="")
  		if User.find_by_email(username_or_email)
  			user=User.find_by_email(username_or_email)
  		else
  			user=User.find_by_username(username_or_email)
  		end
  		if user && user.match_password(login_password)
  			return user
  		else
  			return false
  		end	 	
  	end

  	def match_password(login_password)
  		encrypted_password =BCrypt::Engine.hash_secret(login_password,salt)
  	end
  
end
