class AddSnToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :sn, :integer
  end
end
