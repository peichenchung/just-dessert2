class CreateDesserts < ActiveRecord::Migration[5.2]
  def change
    create_table :desserts do |t|
      t.string :name
      t.integer :price
      t.integer :amount
      t.string :image
      t.text :description
      t.string :location
      t.datetime :production_time
      t.datetime :excess_time
      t.datetime :pick_time
      t.integer :user_id
      t.timestamps
    end
  end
end
