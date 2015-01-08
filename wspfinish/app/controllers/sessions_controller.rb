class SessionsController < ApplicationController

  before_filter :render_smaller_content

  def new
  end

  def create
    user = User.find_by_name(params[:session][:name])

    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = "error username or password"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end