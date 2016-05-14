class AddAttachmentAvatarToComedians < ActiveRecord::Migration
  def self.up
    change_table :comedians do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :comedians, :avatar
  end
end
