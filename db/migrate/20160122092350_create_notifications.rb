class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :content
      t.integer :user_id
      t.integer :order_id
      t.string :msg_type

      t.timestamps null: false
    end
  end
end
