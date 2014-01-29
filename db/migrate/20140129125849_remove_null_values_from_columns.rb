class RemoveNullValuesFromColumns < ActiveRecord::Migration
  def change
    change_column :cells,  "coordinate_x", :integer, null: false
    change_column :cells,  "coordinate_y", :integer, null: false
    change_column :cells,  "hall_id", :integer, null: false

    change_column :halls,  "name", :string, null: false
    change_column :halls,  "storage_id", :integer, null: false
    change_column :halls,  "length", :integer, null: false
    change_column :halls,  "width", :integer, null: false

    change_column :locations,  "name", :string, null: false
    change_column :locations,  "capacity", :integer, null: false, default: 0
    change_column :locations,  "capacity", :integer, default: nil
    change_column :locations,  "location_type", :integer, null: false, default: 0
    change_column :locations,  "location_type", :integer, default: nil
    change_column :locations,  "hall_id", :integer, null: false
    change_column :locations,  "selection_start_x", :integer, null: false
    change_column :locations,  "selection_start_y", :integer, null: false
    change_column :locations,  "selection_end_x", :integer, null: false
    change_column :locations,  "selection_end_y", :integer, null: false

    change_column :storages,  "name", :string, null: false
  end
end
