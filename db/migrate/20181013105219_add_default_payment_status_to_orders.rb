class AddDefaultPaymentStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:orders, :payment_status, 'not_paid')
  end
end
