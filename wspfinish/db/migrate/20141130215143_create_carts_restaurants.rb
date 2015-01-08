class CreateCartsRestaurants < ActiveRecord::Migration
  def change
    create_table :carts_restaurants, :id => false do |t|
      t.integer :cart_id
      t.integer :restaurant_id
    end
  end
end
