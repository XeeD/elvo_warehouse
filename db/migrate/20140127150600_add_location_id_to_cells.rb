class AddLocationIdToCells < ActiveRecord::Migration
  def change
    add_column :cells, :location_id, :integer
  end
end
