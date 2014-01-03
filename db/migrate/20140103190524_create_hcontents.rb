class CreateHcontents < ActiveRecord::Migration
  def change
    create_table :hcontents do |t|
      t.string :title
      t.string :subtitle
      t.text :content

      t.timestamps
    end
  end
end
