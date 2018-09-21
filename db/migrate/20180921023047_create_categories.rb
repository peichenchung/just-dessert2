class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :area
      t.timestamps
    end
    add_column :desserts, :category_id, :integer
  end
end
