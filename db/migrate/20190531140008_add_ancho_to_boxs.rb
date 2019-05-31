class AddAnchoToBoxs < ActiveRecord::Migration[5.1]
  def change
    add_column :boxes, :ancho, :integer, null: false, default: 0
  end
end
