class AddIgTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ig_token, :string
  end
end
