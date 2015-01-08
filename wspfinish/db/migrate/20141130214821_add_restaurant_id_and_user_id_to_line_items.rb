class AddRestaurantIdAndUserIdToLineItems < ActiveRecord::Migration
  def change
  	add_column :line_items, :restaurant_id, :integer
    add_column :line_items, :user_id, :integer
  end
end
