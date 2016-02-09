class ChangeRelationOrderReservation < ActiveRecord::Migration
  def change
    add_column :orders, :reservation_id, :integer
    remove_column :reservations, :order_id, :integer
  end
end
