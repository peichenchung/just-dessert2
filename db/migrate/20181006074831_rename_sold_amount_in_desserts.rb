class RenameSoldAmountInDesserts < ActiveRecord::Migration[5.2]
  def change
    rename_column :desserts, :sold_amount, :origin_amount
  end
end
