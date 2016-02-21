class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :title
      t.text :content
      t.boolean :active, default: false
      t.datetime :date_from
      t.datetime :date_until
      t.attachment :image
      t.timestamps null: false
    end
  end
end
