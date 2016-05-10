class CreateComedians < ActiveRecord::Migration
  def change
    create_table :comedians do |t|
      t.string :name
      t.string :username
      t.string :password

      t.timestamps null: false
    end
    add_index :comedians, :username, unique: true
  end
end
