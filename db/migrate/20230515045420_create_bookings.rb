class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :date
      t.integer :number_of_people
      t.integer :status

      t.timestamps
    end
  end
end
