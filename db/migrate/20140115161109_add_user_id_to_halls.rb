class AddUserIdToHalls < ActiveRecord::Migration
  def change
    add_column :halls, :user_id, :int
  end
end
