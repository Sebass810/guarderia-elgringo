class AddStateToBox < ActiveRecord::Migration[5.1]
  def change
    add_column :boxes, :state, :integer, null: false, default: 0
  end
end
