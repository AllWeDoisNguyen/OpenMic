class Booking < ActiveRecord::Base
  belongs_to :comedians
  belongs_to :shows
end
