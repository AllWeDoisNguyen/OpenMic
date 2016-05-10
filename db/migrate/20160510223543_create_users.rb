class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password

      t.timestamps null: false
    end
    add_index :users, :username, unique: true
  end
end
