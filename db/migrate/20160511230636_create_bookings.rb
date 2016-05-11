class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.belongs_to :comedian, index: true, foreign_key: true
      t.belongs_to :show, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
