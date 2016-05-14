class Comedian < ActiveRecord::Base
	has_secure_password
	validates :name, :username, :password_digest, presence: true
	has_many :bookings
	has_many :shows, :through => :bookings
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/OpenMiic/humor-public-speaking.jpg"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
