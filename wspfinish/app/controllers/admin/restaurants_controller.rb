class Admin::RestaurantsController < ApplicationController
  before_filter :render_smaller_content
  before_filter :signed_in_user

  def index
    @restaurants = Restaurant.all
    @carts = Cart.all
  end

  def new
    @restaurant = Restaurant.new
  end

 def createrestaurant
    argument = params.require(:restaurant).permit(:name, :telephone, :address, :start_time, :end_time)
    @restaurant = Restaurant.new(argument)

    if @restaurant.save
            render action: 'new'

      # redirect_to restaurant_path(@restaurant), notice:  t('created_successfully')
    else
      render action: 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    @restaurant_id = params[:id]
  end
  def updateData

    
    rs = Restaurant.find(params[:restaurant_id])


# <%= input_helper(f, :name, :text_field) %>
#   <%= input_helper(f, :telephone, :text_field) %>
#   <%= input_helper(f, :address, :text_field) %>
#   <%= input_helper(f, :start_time, :time_select) %>
#   <%= input_helper(f, :end_time, :time_select) %>

    argument = params.require(:restaurant).permit(:name, :telephone, :address, :start_time, :end_time)
    # argument = {name:"777777rrrrrr"}


    if rs.update_attributes(argument)
        render action: 'edit', notice: t('updated_successfully')

      # redirect_to restaurant_path(@restaurant), notice: t('updated_successfully')
    else
      # render action: 'edit', notice: t('updated_unsuccessfully')
    end
   
   
  end
  def update
    # @restaurant = Restaurant.find(params[:id])

    # if @restaurant.update_attributes(params[:restaurant])
    #   redirect_to restaurant_path(@restaurant), notice: t('updated_successfully')
    # else
    #   render action: 'edit', notice: t('updated_unsuccessfully')
    # end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.destroy
      redirect_to admin_restaurants_path, notice: t('deleted_successfully')
    else
      redirect_to admin_restaurants_path, notice: t('deleted_unsuccessfully')
    end
  end
end