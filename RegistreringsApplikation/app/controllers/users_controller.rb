class UsersController < ApplicationController  
  def index

  end
  
  def show
    @user = User.find(params[:id])
  end
  
 def new
  @user = User.new
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    @user.key = SecureRandom.hex
    if @user.save
      
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
  
end
