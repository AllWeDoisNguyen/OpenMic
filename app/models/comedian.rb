class Comedian < ActiveRecord::Base
	has_secure_password
	has_many :bookings
	has_many :shows, :through => :bookings
end
