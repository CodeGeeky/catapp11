class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :book_date
      t.string :phone

      t.timestamps
    end
  end
end
