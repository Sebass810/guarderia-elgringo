class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :client, foreign_key: true
      t.references :box, foreign_key: true
      t.date :fecha_desde
      t.date :fecha_hasta
      t.integer :estado

      t.timestamps
    end
  end
end
