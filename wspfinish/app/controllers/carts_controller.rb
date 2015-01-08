class CartsController < ApplicationController

  before_filter :render_smaller_content

  def show
  end

  def create
    cart = current.cart
    
  end

  def new
  
  end

  def update
    redirect_to root_url, notice: "Added to cart"
  end
end