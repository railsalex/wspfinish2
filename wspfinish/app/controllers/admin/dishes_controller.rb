class Admin::DishesController < ApplicationController
  before_filter :render_smaller_content
  before_filter :signed_in_user

  def destroy
    @dish = Dish.find(params[:id])
    restaurant = @dish.group.restaurant

    if @dish.destroy
      redirect_to admin_restaurant_path(restaurant), notice: t('deleted_successfully')
    else
      redirect_to admin_restaurant_path
    end
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])

    if @dish.update_attributes(params[:dish])
      redirect_to admin_restaurant_path(@dish.group.restaurant), notice: t('updated_successfully')
    else
      render 'edit'
    end
  end

  def new
    @dish = Dish.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
     dish_params = params[:dish]
     params.permit!
     @dish = Dish.new(dish_params)
     

    if @dish.save
      redirect_to admin_restaurants_path(), notice: t('created_successfully')
    else
      render 'new'
    end
  end


end