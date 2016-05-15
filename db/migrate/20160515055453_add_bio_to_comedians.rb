class AddBioToComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :bio, :text
  end
end
