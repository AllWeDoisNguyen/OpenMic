class Comedian < ActiveRecord::Base
	has_secure_password
	has_many :bookings
	has_many :shows, :through => :bookings
	has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	validates :name, :username, :password_digest, presence: true
	validates_length_of :bio, maximum: 160


	def next_show
		# self.shows.first
		unless self.shows.first.nil?
			self.shows.first
		else
			""
		end
	end

	def next_show_name
		unless self.shows.first.nil?
			self.shows.first.show_name
		else
			""
		end
	end
end
