class Comedian < ActiveRecord::Base
	has_secure_password
	validates :name, :username, :password_digest, presence: true
	has_many :bookings
	has_many :shows, :through => :bookings
end
