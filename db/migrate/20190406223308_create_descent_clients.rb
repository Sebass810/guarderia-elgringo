class CreateDescentClients < ActiveRecord::Migration[5.1]
  def change
    create_table :descent_clients do |t|
      t.references :client, foreign_key: true
      t.references :boat, foreign_key: true
      t.references :enable_person, foreign_key: true
      t.date :fecha

      t.timestamps
    end
  end
end
