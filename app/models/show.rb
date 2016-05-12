class Show < ActiveRecord::Base
	has_many :bookings
	has_many :comedians, :through => :bookings
	has_many :users, :through => :bookings
end
