class Admin::GroupsController < ApplicationController
  before_filter :render_smaller_content
  before_filter :signed_in_user

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(params[:group])
      redirect_to admin_restaurant_path(@group.restaurant), notice: t("updated_successfully")
    else
      render 'edit', notice: t("updated_unsuccessfully")
    end
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @group = @restaurant.groups.build
  end

  def create
    params.permit!
    restaurant = Restaurant.find(params[:restaurant_id])
    @group = restaurant.groups.build(params[:group])

    if @group.save
      redirect_to admin_restaurant_path(restaurant), notice: t('created_successfully')
    else
      render 'new'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    restaurant = @group.restaurant

    if @group.destroy
      redirect_to admin_restaurant_path(restaurant), notice: t('deleted_successfully')
    else
      render 'edit'
    end
  end
end