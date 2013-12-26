class CreateIbooks < ActiveRecord::Migration
  def change
    create_table :ibooks do |t|
      t.integer :user_id
      t.integer :cart_id
      t.date :when
      t.date :for_when

      t.timestamps
    end
  end
end
