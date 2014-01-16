class CreateCells < ActiveRecord::Migration
  def change
    create_table :cells do |t|
      t.integer :coordinate_x
      t.integer :coordinate_y

      t.timestamps
    end
  end
end
