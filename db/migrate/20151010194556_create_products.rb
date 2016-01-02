class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :weight
      t.integer :quantity, default: 0
      t.integer :category_id
      t.timestamps
    end
  end
end
