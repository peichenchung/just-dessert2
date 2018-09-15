class RemoveSellerIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :seller_id
  end
end
