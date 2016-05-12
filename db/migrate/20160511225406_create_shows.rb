class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :venue
      t.string :venue_website
      t.date :date
      t.time :time

      t.timestamps null: false
    end
  end
end
