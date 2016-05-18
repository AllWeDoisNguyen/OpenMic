class AddLocationToShow < ActiveRecord::Migration
  def change
    add_column :shows, :address, :string
    add_column :shows, :city, :string
    add_column :shows, :state, :string
  end
end
