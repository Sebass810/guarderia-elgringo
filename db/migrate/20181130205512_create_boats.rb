class CreateBoats < ActiveRecord::Migration[5.1]
  def change
    create_table :boats do |t|
      t.references :client, foreign_key: true
      t.string :nombre
      t.string :matricula
      t.string :motor

      t.timestamps
    end
  end
end
