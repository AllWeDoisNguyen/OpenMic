class Show < ActiveRecord::Base
	has_many :bookings
	has_many :comedians, :through => :bookings
end
