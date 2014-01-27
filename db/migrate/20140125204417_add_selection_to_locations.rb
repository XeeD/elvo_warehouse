class AddSelectionToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :selection_start_x, :integer
    add_column :locations, :selection_start_y, :integer
    add_column :locations, :selection_end_x, :integer
    add_column :locations, :selection_end_y, :integer
  end
end
