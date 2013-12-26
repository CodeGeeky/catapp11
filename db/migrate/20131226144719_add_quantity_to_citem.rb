class AddQuantityToCitem < ActiveRecord::Migration
  def change
    add_column :citems, :quantity, :integer
  end
end
