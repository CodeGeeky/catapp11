class RemoveCartIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :cart_id, :integer
  end
end
