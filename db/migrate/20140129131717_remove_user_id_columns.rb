class RemoveUserIdColumns < ActiveRecord::Migration
  def change
    remove_column :halls, :user_id
    remove_column :storages, :user_id
  end
end
