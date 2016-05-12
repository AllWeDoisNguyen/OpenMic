class User < ActiveRecord::Base
	has_secure_password
	validates :name, :username, :password_digest, presence: true
end
