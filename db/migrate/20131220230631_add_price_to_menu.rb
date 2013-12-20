class AddPriceToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :price, :float
  end
end
