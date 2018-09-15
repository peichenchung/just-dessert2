class ChangeProductionTimeToBeStringInDesserts < ActiveRecord::Migration[5.2]
  def change
    change_column :desserts, :production_time, :string
  end
end
