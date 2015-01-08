class LineItemsController < ApplicationController
  before_filter :signed_in_user

  def create
    cart = current_cart
    dish = Dish.find(params[:dish_id])
    user = current_user
    restaurant = dish.restaurant
    @line_item = cart.add_dish(dish.id, restaurant.id, user.id)

    if @line_item.save
      redirect_to restaurant_path(restaurant), notice: t("added_to_cart_successfully")
    else
      render action: 'new'
    end
  end

  def new
    @line_item = LineItem.new

  def destroy
    line_item = LineItem.find(params[:id])
    if line_item.destroy
      redirect_to current_cart
    else
    end
  end

  private

end