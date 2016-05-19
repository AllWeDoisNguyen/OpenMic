class AddTwitterHandleToComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :twitter_handle, :string
  end
end
