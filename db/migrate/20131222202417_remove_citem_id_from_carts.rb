class RemoveCitemIdFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :citem_id, :integer
  end
end
