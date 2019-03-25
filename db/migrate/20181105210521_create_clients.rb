class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :apellido
      t.string :dni
      t.string :TelǸfono
      t.string :celular
      t.string :estado

      t.timestamps
    end
  end
end