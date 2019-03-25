class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.string :descripcion
      t.string :tamano

      t.timestamps
    end
  end
end
