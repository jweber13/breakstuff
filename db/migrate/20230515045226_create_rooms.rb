class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.text :story
      t.string :description
      t.integer :capacity
      t.integer :price

      t.timestamps
    end
  end
end
