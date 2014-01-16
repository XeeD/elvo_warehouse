class AddLengthToHalls < ActiveRecord::Migration
  def change
    add_column :halls, :length, :int
  end
end
