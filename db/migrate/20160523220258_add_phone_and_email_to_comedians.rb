class AddPhoneAndEmailToComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :phone, :float
    add_column :comedians, :email, :string
  end
end
