class AddBookingIdToComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :booking_id, :integer
  end
end
