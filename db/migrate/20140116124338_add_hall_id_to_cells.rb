class AddHallIdToCells < ActiveRecord::Migration
  def change
    add_column :cells, :hall_id, :int
  end
end
