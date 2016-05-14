class AddBookingIdToShows < ActiveRecord::Migration
  def change
    add_column :shows, :booking_id, :integer
  end
end
