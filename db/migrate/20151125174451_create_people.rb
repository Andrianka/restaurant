class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :roles_mask
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.string :tel

      t.timestamps
    end
  end
end
