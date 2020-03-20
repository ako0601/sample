class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :email
      t.string :name
      t.text :body
      t.integer :shop_id

      t.timestamps
    end
  end
end