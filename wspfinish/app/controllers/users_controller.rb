class UsersController < ApplicationController
  
  before_filter :render_smaller_content, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    secure_params = params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation)
        @user = User.new(secure_params)

    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end
end