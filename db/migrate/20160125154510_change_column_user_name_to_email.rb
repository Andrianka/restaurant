class ChangeColumnUserNameToEmail < ActiveRecord::Migration
  def change
    rename_column :reservations, :user_name, :email
  end
end
