class CreateEnabledClients < ActiveRecord::Migration[5.1]
  def change
    create_table :enabled_clients do |t|
      t.references :enabled_person#, foreign_key: true
      t.references :client#, foreign_key: true
      t.string :descripcion

      t.timestamps
    end
  end
end
