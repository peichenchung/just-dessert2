class AddSoldAmountToDesserts < ActiveRecord::Migration[5.2]
  def change
    add_column :desserts, :sold_amount, :integer
  end
end
