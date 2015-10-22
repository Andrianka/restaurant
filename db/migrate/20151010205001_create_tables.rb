class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :nr
      t.integer :quantity

      t.timestamps
    end
  end
end
