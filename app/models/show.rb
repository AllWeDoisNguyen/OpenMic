class Show < ActiveRecord::Base
	has_many :bookings
	has_many :comedians, :through => :bookings
	has_many :users, :through => :bookings
	belongs_to :owner, class_name: "User"
	belongs_to :owner, class_name: "Comedian"
end
