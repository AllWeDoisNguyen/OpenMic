class Comedian < ActiveRecord::Base
	has_secure_password
	has_many :bookings
	has_many :shows, :through => :bookings
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	validates :name, :username, :password_digest, presence: true
	validates_length_of :bio, maximum: 160

	# Old Method
	# def next_show
	# 	@next_show = self.shows.first
	# 	unless @next_show.nil?
	# 		@next_show
	# 	else
	# 		""
	# 	end
	# end

	def show
		@comedian = self 
		@show = @comedian.bookings.find_by(show_id: @comedian.id)
	end

	def next_show
		if self.nil?
			""
		else
			self.shows.sort_by(&:date).reverse.first
		end
	end

	def next_show_name
		unless self.next_show.nil?
			self.next_show.show_name
		else
			""
		end
	end

end
