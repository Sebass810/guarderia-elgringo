class CreateEnablePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :enable_people do |t|
      t.references :client, foreign_key: true
      t.string :nombre
      t.string :apellido
      t.string :dni
      t.integer :estado, null: false, default: 0

      t.timestamps
    end
  end
end
