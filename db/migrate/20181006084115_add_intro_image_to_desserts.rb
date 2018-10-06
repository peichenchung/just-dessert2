class AddIntroImageToDesserts < ActiveRecord::Migration[5.2]
  def change
    add_column :desserts, :intro_image, :string
  end
end
