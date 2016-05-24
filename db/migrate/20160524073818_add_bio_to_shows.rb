class AddBioToShows < ActiveRecord::Migration
  def change
    add_column :shows, :bio, :text
  end
end
