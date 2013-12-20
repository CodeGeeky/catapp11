class AddQuantityToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :quantity, :integer
  end
end
