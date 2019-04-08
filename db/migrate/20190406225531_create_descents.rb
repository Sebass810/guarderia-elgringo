class CreateDescents < ActiveRecord::Migration[5.1]
  def change
    create_table :descents do |t|
      t.string :nombre
      t.string :apellido
      t.string :dni
      t.string :nombre_bote
      t.string :matricula_bote
      t.string :motor_bote
      t.date :fecha

      t.timestamps
    end
  end
end
