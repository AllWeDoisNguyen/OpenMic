class Booking < ActiveRecord::Base
  belongs_to :comedians
  belongs_to :shows
  belongs_to :users
end
