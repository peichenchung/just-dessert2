class AddIgImageUrlToDesserts < ActiveRecord::Migration[5.2]
  def change
    add_column :desserts, :ig_image_url, :string
  end
end
