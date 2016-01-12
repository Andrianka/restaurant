class AddColumnTotalPriceToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :total_price, :decimal, precision: 12, scale: 3
    add_column :order_items, :unit_price, :decimal, precision: 12, scale: 3
    remove_column :order_items, :price, :decimal
  end
end
