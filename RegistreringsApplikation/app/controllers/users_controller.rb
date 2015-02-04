class UsersController < ApplicationController  
 
    before_action :check_user, only: [:show, :destroy]
    before_action :correct_user, only: [:show]
  
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
      
      flash[:success] = "Welcome to Webbteknik2!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.update_attribute(:key, nil)
    redirect_to @user
  end
  
  def generate_key
    
  end
  
  def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
  def edit
    @user = User.find(params[:id])
  end
 
  
  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
  
end
