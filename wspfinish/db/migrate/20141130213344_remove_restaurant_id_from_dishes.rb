class RemoveRestaurantIdFromDishes < ActiveRecord::Migration
  def up
    remove_column :dishes, :restaurant_id
  end

  def down
    add_column :dishes, :restaurant_id, :integer
  end
end
