class AddLocationToComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :city, :string
    add_column :comedians, :facebook, :string
    add_column :comedians, :youtube, :string
  end
end
