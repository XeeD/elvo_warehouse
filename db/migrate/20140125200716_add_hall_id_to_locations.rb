class AddHallIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :hall_id, :integer, null: false
    add_index :locations, :hall_id
  end
end
