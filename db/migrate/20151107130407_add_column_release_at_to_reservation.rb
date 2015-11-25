class AddColumnReleaseAtToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :release_at, :datetime
  end
end
