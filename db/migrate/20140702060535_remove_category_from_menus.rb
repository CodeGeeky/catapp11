class RemoveCategoryFromMenus < ActiveRecord::Migration
  def change
    remove_column :menus, :category, :integer
  end
end
