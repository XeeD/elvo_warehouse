class AddStorageIdToHalls < ActiveRecord::Migration
  def change
    add_column :halls, :storage_id, :int
  end
end
