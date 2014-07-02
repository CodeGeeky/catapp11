class DropSpudDatabase < ActiveRecord::Migration
  def up
    drop_table :spud_permissions
    drop_table :spud_photo_albums
    drop_table :spud_photo_albums_photos
    drop_table :spud_photo_galleries
    drop_table :spud_photo_galleries_albums
    drop_table :spud_photos
    drop_table :spud_user_settings
    drop_table :spud_users
    drop_table :spud_role_permissions
    drop_table :spud_roles
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
