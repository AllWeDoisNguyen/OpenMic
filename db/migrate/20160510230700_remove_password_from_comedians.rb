class RemovePasswordFromComedians < ActiveRecord::Migration
  def change
    remove_column :comedians, :password, :string
  end
end
