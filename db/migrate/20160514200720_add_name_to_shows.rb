class AddNameToShows < ActiveRecord::Migration
  def change
    add_column :shows, :show, :string
  end
end
