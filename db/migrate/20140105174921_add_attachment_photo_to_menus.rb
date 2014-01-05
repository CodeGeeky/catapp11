class AddAttachmentPhotoToMenus < ActiveRecord::Migration
  def self.up
    change_table :menus do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :menus, :photo
  end
end
