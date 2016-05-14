class Show < ActiveRecord::Base
	has_many :bookings
	has_many :comedians, :through => :bookings
	has_many :users, :through => :bookings
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	belongs_to :owner, class_name: "Comedian", foreign_key: "comedian_id"


end
