class ChangeColumnAvatarInPerson < ActiveRecord::Migration
  def change
    remove_column :people, :avatar, :avatar
    add_attachment :people, :avatar
  end
end
