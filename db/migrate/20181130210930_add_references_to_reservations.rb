class AddReferencesToReservations < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :boat, foreign_key: true
  end
end
