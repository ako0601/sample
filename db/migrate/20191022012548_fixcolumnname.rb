class Fixcolumnname < ActiveRecord::Migration[6.0]
  def change
    rename_column :request, :request_id, :shop_id
  end
end
