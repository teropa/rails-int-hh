class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :book
      t.string :state
      t.string :email

      t.timestamps
    end
    
    add_index :reservations, :book_id
  end
end
