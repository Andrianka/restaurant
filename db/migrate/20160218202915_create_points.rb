class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :form_completed
      t.integer :avatar
      t.integer :order
      t.integer :registration
      t.boolean :is_active, default: false
      t.timestamps null: false
    end
  end
end
