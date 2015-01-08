class Cart < ActiveRecord::Base
 attr_accessor :address, :telephone
  validates :address, presence: true
  validates :telephone, presence: true
  has_many :line_items, dependent: :destroy
  has_and_belongs_to_many :restaurants

  def add_dish(dish_id, restaurant_id, user_id)
    current_item = line_items.find_by_dish_id(dish_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(dish_id: dish_id,
                                      restaurant_id: restaurant_id,
                                      user_id: user_id)
      restaurant = Restaurant.find(restaurant_id)
      unless restaurants.exists?(restaurant)
        restaurants << restaurant
      end
    end
    current_item
  end

  def sum_price
    sum = 0
    line_items.each do |item|
      sum += item.dish.price * item.quantity
    end
    sum
  end         
end
