class AddStateToBoat < ActiveRecord::Migration[5.1]
  def change
    add_column :boats, :state, :integer
  end
end
