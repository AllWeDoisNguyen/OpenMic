class Comedian < ActiveRecord::Base
	has_secure_password
	validates :name, :username, :password_digest, presence: true
	has_many :bookings
	has_many :shows, :through => :bookings
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "OpenMiic/humor-public-speaking-100px.jpg", :default_style => :thumb
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

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
