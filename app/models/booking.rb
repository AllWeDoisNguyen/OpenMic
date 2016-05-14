class Booking < ActiveRecord::Base
  belongs_to :comedian
  belongs_to :show
  belongs_to :user #should this be singular and as an owner?
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  #if we specify the owner here do we need the top two lines?
  belongs_to :owner, class_name: "Comedian", foreign_key: "comedian_id"
  validates :comedian, presence: true
  validates :show, presence: true

  def find_id_by_comedian_username
  	@comedian_username = params[:username]
  	Comedian.find_by(username: @comedian_username)
  end

  def find_id_by_show_name

  end
end
