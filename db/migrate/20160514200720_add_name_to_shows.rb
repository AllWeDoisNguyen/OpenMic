class AddNameToShows < ActiveRecord::Migration
  def change
    add_column :shows, :show_name, :string
  end
end
