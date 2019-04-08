class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :apellido
      t.string :dni
      t.string :telefono
      t.string :celular
      t.string :estado, null: false, default: 0

      t.timestamps
    end
  end
end