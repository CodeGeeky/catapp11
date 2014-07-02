class RemoveWhenFromIbook < ActiveRecord::Migration
  def change
    remove_column :ibooks, :when, :date
  end
end
