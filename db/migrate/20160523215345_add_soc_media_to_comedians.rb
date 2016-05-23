class AddSocMediaToComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :instagram, :string
  end
end
