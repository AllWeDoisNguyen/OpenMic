class AddAttachmentAvatarToShows < ActiveRecord::Migration
  def self.up
    change_table :shows do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :shows, :avatar
  end
end
