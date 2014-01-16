class AddWidthToHalls < ActiveRecord::Migration
  def change
    add_column :halls, :width, :int
  end
end
