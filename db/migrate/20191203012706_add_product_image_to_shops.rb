class AddProductImageToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :productImage, :string
  end
end
