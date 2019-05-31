class AddLargoToBoxs < ActiveRecord::Migration[5.1]
  def change
    add_column :boxes, :largo, :integer, null: false, default: 0
  end
end
