class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :table_id
      t.integer :user_id
      t.integer :order_id

      t.timestamps
    end
  end
end
