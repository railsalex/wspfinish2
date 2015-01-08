class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  
  
  def show
    @restaurant = Restaurant.find(params[:id])
    if(params[:type])
      group = Group.find(params[:type])
      @dishes = group.dishes
    else
      @dishes = @restaurant.dishes
    end
  end
end