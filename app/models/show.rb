class Show < ActiveRecord::Base
	has_many :bookings
	has_many :reviews
	has_many :comedians, :through => :bookings
	has_many :users, :through => :bookings
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	belongs_to :owner, class_name: "Comedian", foreign_key: "comedian_id"
	has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	accepts_nested_attributes_for :bookings
	validates :date, presence: true

	 def average_review
	 	if self.reviews.blank?
	 		0
		else 
			self.reviews.average(:rating).round(2)
		end
  end
end
