class RenameUidInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :uid, :ig_uid
  end
end
