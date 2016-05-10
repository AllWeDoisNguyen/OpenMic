class AddPasswordDigestToComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :password_digest, :string
  end
end
