class AddDefaultShippingStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:orders, :shipping_status, '未完成')
  end
end
