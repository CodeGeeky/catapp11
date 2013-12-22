class CreateCitems < ActiveRecord::Migration
  def change
    create_table :citems do |t|
      t.integer :menu_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
