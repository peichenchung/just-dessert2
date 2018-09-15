class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :dessert_id
      t.integer :seller_id
      t.integer :buyer_id
      t.string :name #購買人姓名
      t.string :phone #購買人電話
      t.integer :amount #訂單數量
      t.integer :order_price #訂單金額
      t.string :pick_location
      t.string :shipping_status
      t.string :payment_status
      t.integer :sn #訂單編號
      t.timestamps
    end
  end
end
