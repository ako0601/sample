class AddRatingToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :rating, :integer
  end
end
